-- Read bytes from a PS2 bus
-- Encode bytes into scancodes
-- Does not handle scancodes containing "E0" or "E1" bytes.

-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;            -- basic IEEE library
use IEEE.NUMERIC_STD.ALL;               -- IEEE library for the unsigned type
                                        -- and various arithmetic operations

-- entity
entity KBD_ENC is
	port (
		clk             : in std_logic;   -- system clock (100 MHz)
		rst             : in std_logic;   -- reset signal
		PS2KeyboardCLK  : in std_logic;   -- USB keyboard PS2 clock
		PS2KeyboardData : in std_logic;   -- USB keyboard PS2 data
		ScanCode        : out std_logic_vector(7 downto 0); -- scancode byte
		MAKE_op         : out std_logic);                   -- one-pulsed scancode-enable
end KBD_ENC;

-- architecture
architecture behavioral of KBD_ENC is
	signal PS2Clk  : std_logic;              -- Synchronized PS2 clock
	signal PS2Data : std_logic;              -- Synchronized PS2 data
	signal PS2Clk_Q1, PS2Clk_Q2 : std_logic; -- PS2 clock one pulse flip flop
	signal PS2Clk_op : std_logic;            -- PS2 clock one pulse 
	
	signal PS2Data_sr : std_logic_vector(10 downto 0);-- PS2 data shift register
	signal ScanCode_int : std_logic_vector(7 downto 0); -- internal version of ScanCode
	
	signal PS2BitCounter : unsigned(3 downto 0); -- PS2 bit counter
	signal BC11 : std_logic;                     -- '1' when PS2BitCounter = 11
	
	type state_type is (IDLE, MAKE, BREAK); -- declare state types for PS2
	signal PS2state : state_type;           -- PS2 state
	
begin
	
	-- Synchronize PS2-KBD signals
	process(clk)
	begin
		if rising_edge(clk) then
			PS2Clk <= PS2KeyboardCLK;
			PS2Data <= PS2KeyboardData;
		end if;
	end process;
	
        
	-- Generate one cycle pulse from PS2 clock, negative edge
	process(clk)
	begin
		if rising_edge(clk) then
			if rst='1' then
				PS2Clk_Q1 <= '1';
				PS2Clk_Q2 <= '0';
			else
				PS2Clk_Q1 <= PS2Clk;
				PS2Clk_Q2 <= not PS2Clk_Q1;
			end if;
		end if;
	end process;
	
	PS2Clk_op <= (not PS2Clk_Q1) and (not PS2Clk_Q2);
	
	-- PS2 data shift register
	process(clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				PS2Data_sr <= (others => '0'); -- Reset
			elsif PS2Clk_op = '1' then -- Negativ flank
				PS2Data_sr <= PS2Data & PS2Data_sr(10 downto 1);
			end if;
		end if;
	end process;

    ScanCode_int <= PS2Data_sr(8 downto 1); 
	ScanCode <= ScanCode_int;  -- för utsignal

	-- PS2 bit counter
	process(clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				PS2BitCounter <= (others => '0'); 
				BC11 <= '0';
			elsif PS2BitCounter = 11 then
				PS2BitCounter <= (others => '0'); -- Reset när 11
				BC11 <= '1';
			elsif PS2Clk_op = '1' then
				PS2BitCounter <= PS2BitCounter + 1; 
				BC11 <= '0';
			else 
				BC11 <= '0';
			end if;
		end if;
	end process;

    -- PS2 state
	-- Either MAKE or BREAK state is identified from the scancode
	-- Only single character scan codes are identified
	process(clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				PS2state <= IDLE; 	
			else
				case PS2state is
					when IDLE =>
						if BC11 = '1' then 		
							if ScanCode_int = "11110000" then -- Break
								PS2state <= BREAK;
							else
								PS2state <= MAKE; 
							end if;
						end if;
					when MAKE =>
						PS2state <= IDLE; 
					when BREAK =>
						if BC11 = '1' then 	
							PS2state <= IDLE; 
						end if;
					when others =>
						PS2state <= IDLE; 
				end case;
			end if;
		end if;
	end process;
	
	MAKE_op <= '1' when PS2state = MAKE else '0';
	
end behavioral;
