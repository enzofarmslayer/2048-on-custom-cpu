library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--CPU interface
entity uprogCPU is
  port(clk: in std_logic;
  		rst : in std_logic;   -- reset signal
  		--btnC : in std_logic     -- reset button (middle of the five), active high
		ScanCode   : in std_logic_vector(7 downto 0);  -- scancode byte
		make_op    : in std_logic;                   -- one-pulsed scancode-enable
		data_out     : out unsigned(3 downto 0);  -- tile data
		addr_out     : out unsigned(3 downto 0);         -- tile address
		weCPU       : out std_logic              -- write enable
	);
end entity;

architecture func of uprogCPU is

	--signal rst : std_logic;       -- synchronous clear

	-- micro Memory component
	component uMem
		port(uAddr : in unsigned(5 downto 0);
			uData : out unsigned(22 downto 0));
	end component;

	-- program Memory component
	component pMem
		port(pAddr : in unsigned(15 downto 0);
			pData : out unsigned(15 downto 0));
	end component;

	-- reg file
	component regFile
		port (clk     : in  std_logic;
		  we      : in  std_logic;                  -- Write enable
		  addr   : in  unsigned(3 downto 0);       -- Read/Write address
		  wData   : in  unsigned(7 downto 0);       -- Data to write
		  rData   : out unsigned(7 downto 0)        -- Data read
		);
	end component;

	-- uprogALU
	component uprogALU
    port(
        opcode  : in unsigned(3 downto 0);
        rData   : in unsigned(7 downto 0);
        AR_in   : in unsigned(7 downto 0);
		AR_out 	: out unsigned(7 downto 0);
        Z_flag  : out std_logic;
        N_flag  : out std_logic
    );
	end component;


	-- micro memory signals 
	signal uM : unsigned(22 downto 0); -- micro Memory output
	alias ALU_opcode : unsigned(3 downto 0) is uM(22 downto 19);
	alias TB : unsigned(2 downto 0) is uM(18 downto 16);
	alias FB : unsigned(2 downto 0) is uM(15 downto 13);
	alias S : std_logic is uM(12); -- Switch for register file
	alias PCsig : std_logic is uM(11);  -- (0:PC=PC, 1:PC++)
	alias SEQ : unsigned(3 downto 0) is uM(10 downto 7); 
	alias uAddr : unsigned(6 downto 0) is uM(6 downto 0);

	-- program memory signals
	signal PM : unsigned(15 downto 0); -- Program Memory output

	-- reg file signals
	signal r_we : std_logic := '0';
	signal r_addr : unsigned (3 downto 0);
	signal r_rData : unsigned (7 downto 0);
	signal r_wData : unsigned (7 downto 0);

	-- local registers
	signal uPC : unsigned(5 downto 0); -- micro Program Counter
	signal PC : unsigned(15 downto 0); -- Program Counter
	signal IR : unsigned(15 downto 0); -- Instruction Register
	signal ASR : unsigned(15 downto 0); -- Address Register
	signal AR : unsigned(7 downto 0); -- akumelator register
	
	signal SR  : std_logic_vector(7 downto 0);  -- Status-register (bit 0 = Z, bit 1 = N)
	alias Zf : std_logic is SR(0);
	alias Nf : std_logic is SR(1);

	-- local combinatorials
	signal DATA_BUS : unsigned(15 downto 0); -- Data Bus
	signal K1 : unsigned(3 downto 0); 

	-- SR signals
	signal Z_flag, N_flag : std_logic;   

	-- alu result
	signal alu_result : unsigned(7 downto 0);  

	-- signals for IN
	signal read_scancode_flag : std_logic := '0';

begin
	-- process(clk)
	-- begin
	-- 	if rising_edge(clk) then
	-- 		rst <= btnC; -- syncronize the reset signal
	-- 	end if;
	-- end process;

	K1 <= "0011" when (IR(15 downto 12) = "0000") else  -- K1 = 2 when IR = 0
	"0101" when (IR(15 downto 12) = "0001") else  -- K1 = 5 when IR = 1
	"0110" when (IR(15 downto 12) = "0010") else  -- K1 = 6 when IR = 2
	"1000" when (IR(15 downto 12) = "0011") else  -- K1 = 8 when IR = 3
	"1001" when (IR(15 downto 12) = "0100") else
	"0000";                             

	-- mPC : micro Program Counter
	process(clk)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				uPC <= (others => '0');
			elsif (SEQ = "0101") then
				uPC <= uAddr(5 downto 0);
			elsif (SEQ = "0000") then
				uPC <= uPC + 1;
			elsif (SEQ = "0001") then
				uPC <= resize(K1, 6);  -- Resize K1 to 6 bits (padding with zeros)
			elsif (SEQ = "0011") then
				uPC <= (others => '0');
			elsif (SEQ = "1111") then 
				uPC <= uPC;
			end if;
		end if;
	end process;

	-- PC : Program Counter
	process(clk)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				PC <= (others => '0');
			elsif (PCsig = '1') then
				PC <= PC + 1;
			elsif (FB = "011") then
				PC <= DATA_BUS;
			end if;
		end if;
	end process;

	-- IR : Instruction Register
	process(clk)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				IR <= (others => '0');
			elsif (FB = "001") then
				IR <= DATA_BUS;
			end if;
		end if;
	end process;

	-- ASR : Address Register
	process(clk)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				ASR <= (others => '0');
			elsif (FB = "010") then
				ASR <= DATA_BUS;
			end if;
		end if;
	end process;

	-- SR : Status-register (latches Z and N flags every cycle)
	process(clk)
	begin
	if rising_edge(clk) then
		if rst = '1' then
		SR <= (others => '0');
		else
		SR(0) <= Z_flag;           -- Z-flag from ALU
		SR(1) <= N_flag;           -- N-flag from ALU
		-- remaining bits reserved for future use
		end if;
	end if;
	end process;
	
	-- AR
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				AR <= (others => '0');
			else 
				AR <= alu_result;
			end if;
		end if;
	end process;

	-- IN and flag reg
	process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                read_scancode_flag <= '0';
            elsif make_op = '1' and read_scancode_flag = '0' then
                read_scancode_flag <= '1';
            elsif read_scancode_flag = '1' then
				if (TB = "111") then
                	read_scancode_flag <= '0';  -- Reset the flag after reading the scancode
				end if;
            end if;
        end if;
    end process;

	--signals for regfile 
	r_we <= '1' when (FB = "100") else '0';  -- Enable write when FB = "001", else disable it
	--r_addr <= IR(11 downto 8) when (FB = "100") else "0000";
	r_addr <= IR(11 downto 8);
	r_wData <= DATA_BUS(7 downto 0) when (FB = "100") else (others => '0');
	
	-- out signals (to video ram)
	addr_out <= ASR(3 downto 0) when (FB = "101") else (others => '0');  -- Memory address should be ASR when writing
	data_out <= DATA_BUS(3 downto 0) when (FB = "101") else (others => '0');  -- Memory data should be DATA_BUS when writing
	weCPU <= '1' when (FB = "101") else '0'; --weCPU 

	-- micro memory component connection
	U0 : uMem port map(uAddr=>uPC, uData=>uM);

	-- program memory component connection
	U1 : pMem port map(pAddr=>ASR, pData=>PM);

	-- reg file component connection
	U2 : regFile port map(clk=>clk, we=>r_we, addr=>r_addr, wData=>r_wData, rData=>r_rData);

	-- ALU component connection
	U4 : uprogALU port map(opcode=>ALU_opcode, rData=>r_rData, AR_in=>AR, AR_out=>alu_result, Z_flag=>Z_flag, N_flag=>N_flag);

	-- data bus assignment
	DATA_BUS <= "00000000" & IR(7 downto 0) when (TB = "001") else
		PM when (TB = "010") else
		PC when (TB = "011") else
		ASR when (TB = "100") else
		"00000000" & r_rData when (TB = "101") else -- GRx till databuss
		"00000000" & AR when (TB = "100") else
		"00000000" & unsigned(ScanCode) when (TB = "111" and read_scancode_flag = '1') else
		(others => '0');

end architecture;
