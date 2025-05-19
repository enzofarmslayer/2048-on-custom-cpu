library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--CPU interface
entity uprogCPU is
  port(clk: in std_logic;
  		rst : in std_logic;                               -- reset signal
		ScanCode   : in std_logic_vector(7 downto 0);     -- scancode byte
		make_op    : in std_logic;                   	  -- one-pulsed scancode-enable
		data_out     : out std_logic_vector(3 downto 0);  -- tile data
		addr_out     : out unsigned(3 downto 0);          -- tile address
		weCPU       : out std_logic;              		  -- write enable
		vram_in : in std_logic_vector(3 downto 0)         --
	);
end entity;

architecture func of uprogCPU is

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
		  we      : in  std_logic;                 -- Write enable
		  addr   : in  unsigned(3 downto 0);       -- Read/Write address
		  wData   : in  unsigned(7 downto 0);      -- Data to write
		  rData   : out unsigned(7 downto 0)       -- Data to read
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
	signal uM : unsigned(22 downto 0); 								-- Micro Memory output
	alias ALU_opcode : unsigned(3 downto 0) is uM(22 downto 19);	
	alias TB : unsigned(2 downto 0) is uM(18 downto 16);
	alias FB : unsigned(2 downto 0) is uM(15 downto 13);
	alias S : std_logic is uM(12); 									-- Switch for register file
	alias PCsig : std_logic is uM(11);  							-- (0:PC=PC, 1:PC++)
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
	signal uPC : unsigned(5 downto 0); 		-- micro Program Counter
	signal PC : unsigned(15 downto 0); 		-- Program Counter
	signal IR : unsigned(15 downto 0); 		-- Instruction Register
	signal ASR : unsigned(15 downto 0); 	-- Address Register
	signal AR : unsigned(7 downto 0); 		-- Akumelator register
	
	signal SR  : std_logic_vector(7 downto 0);  -- Status-register (bit 0 = Z, bit 1 = N)
	alias Zf : std_logic is SR(0);	
	alias Nf : std_logic is SR(1);

	-- local combinatorials
	signal DATA_BUS : unsigned(15 downto 0); -- Data Bus
	signal K1 : unsigned(4 downto 0); -- K1(LUT/ROM??)

	-- SR signals
	signal Z_flag, N_flag : std_logic;   

	-- alu result
	signal alu_result : unsigned(7 downto 0);  

	-- signals for "IN" register and flag
	signal read_scancode_flag : std_logic := '0';
	signal IN_reg : unsigned(7 downto 0);

	-- signals for addresdecoder
	signal vram_sel  : std_logic := '0';                  -- ‘1’ - ASR is 0-15
	signal pm_addr   : unsigned(15 downto 0);      

	-- HALT switch
	signal halt_switch : std_logic := '0';

begin

	K1 <= "00011" when (IR(15 downto 12) = "0000") and (IR /= "0000000000000000") else  -- K1 = 3 when IR = 0 and IR is not all 0es
	"00110" when (IR(15 downto 12) = "0001") else  -- K1 = 5 when IR = 1
	"00111" when (IR(15 downto 12) = "0010") else  -- K1 = 6 when IR = 2
	"01001" when (IR(15 downto 12) = "0011") else  -- K1 = 8 when IR = 3
	"01010" when (IR(15 downto 12) = "0100") else  -- K1 = 9 when IR = 4
	"01101" when (IR(15 downto 12) = "0101") else  -- K1 = 12 when IR = 5
	"01110" when (IR(15 downto 12) = "0110") else  -- K1 = 13 when IR = 6
	"01111" when (IR(15 downto 12) = "0111") else  -- K1 = 14 when IR = 7
	"10001" when (IR(15 downto 12) = "1000") else  -- K1 = 16 when IR = 8
	"10010" when (IR(15 downto 12) = "1001") else  -- K1 = 17 when IR = 9
	"10011" when (IR(15 downto 12) = "1010") else  -- K1 = 18 when IR = 10
	"00000";                             

	-- mPC : micro Program Counter
	process(clk)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				uPC <= (others => '0');  -- Reset uPC on reset signal
			elsif (halt_switch = '0') then  -- Check if CPU is halted
				if (SEQ = "0101") then
					uPC <= uAddr(5 downto 0);  -- Update uPC based on address
				elsif (SEQ = "0000") then
					uPC <= uPC + 1;  -- Increment uPC if not halted
				elsif (SEQ = "0001") then
					uPC <= resize(K1, 6);  -- Resize K1 to 6 bits (padding with zeros)
				elsif (SEQ = "0011") then
					uPC <= (others => '0');  -- Reset uPC to 0
				elsif (SEQ = "1111") then 
					halt_switch <= '1';  -- Trigger halt
				elsif (SEQ = "1000") then
					if Zf = '0' then
						uPC <= uAddr(5 downto 0);
					else 
						uPC <= (others => '0');
					end if;
				elsif (SEQ = "0100") then
					if Zf = '1' then
						uPC <= uAddr(5 downto 0);
					else
						uPc <= (others => '0');
					end if;
				end if;
			end if;
		end if;
	end process;
	

	-- PC : Program Counter 
	process(clk)
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				PC <= to_unsigned(16, PC'length);  -- Reset PC on reset signal, should start at 16 according to adressdecoder
			elsif (halt_switch = '0') then         -- Check if CPU is halted
				if (PCsig = '1') then
					PC <= PC + 1;  
				elsif (FB = "011") then
					PC <= DATA_BUS;  
				end if;
			end if;
		end if;
	end process;
	

	-- IR 
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

	-- Address decoder singals 			
	vram_sel <= '1' when ASR(15 downto 4) = "000000000000" else '0';
	pm_addr <= ASR - to_unsigned(16, ASR'length) when ASR(15 downto 4) /= "000000000000" else (others => '0');

	-- ASR 
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

	-- SR (latches Z and N flags every cycle)
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

	-- IN register and flag 
	process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                read_scancode_flag <= '0';
            elsif make_op = '1' and read_scancode_flag = '0' then
                read_scancode_flag <= '1';
				IN_reg <= unsigned(ScanCode);
            elsif read_scancode_flag = '1' then
				if (TB = "111") then
                	read_scancode_flag <= '0';  -- Reset the flag after reading the scancode
					IN_reg <= (others => '0');
				end if;
            end if;
        end if;
    end process;

	--signals for regfile 
	r_we <= '1' when (FB = "100") else '0';  
	r_addr <= IR(11 downto 8) when S = '0' else IR(3 downto 0);
	r_wData <= DATA_BUS(7 downto 0) when (FB = "100") else (others => '0');
	
	-- OUT signals (to video ram)
	addr_out <= ASR(3 downto 0) when vram_sel = '1' and (FB = "101" or TB = "010") else (others => '0');
	data_out <= std_logic_vector(DATA_BUS(3 downto 0)) when (FB = "101") else (others => '0');
	weCPU <= '1' when vram_sel = '1' and FB = "101" and IR(15 downto 12) = "0010" else '0';

	-- micro memory component connection
	uMem1 : uMem port map(uAddr=>uPC, uData=>uM);

	-- program memory component connection
	pMem1 : pMem port map(pAddr=>pm_addr, pData=>PM);

	-- reg file component connection
	regFile1 : regFile port map(clk=>clk, we=>r_we, addr=>r_addr, wData=>r_wData, rData=>r_rData);

	-- ALU component connection
	ALU1 : uprogALU port map(opcode=>ALU_opcode, rData=>r_rData, AR_in=>AR, AR_out=>alu_result, Z_flag=>Z_flag, N_flag=>N_flag);

	-- data bus assignment
	DATA_BUS <= "00000000" & IR(7 downto 0) when (TB = "001") else
		PM when (TB = "010" and vram_sel = '0')  else
		"000000000000" & unsigned(vram_in) when (TB = "010" and vram_sel = '1') else
		PC when (TB = "011") else
		"00000000" & r_rData when (TB = "101") else 
		"00000000" & AR when (TB = "100") else
		"00000000" & IN_reg when (TB = "111" and read_scancode_flag = '1') else
		(others => '0');

end architecture;
