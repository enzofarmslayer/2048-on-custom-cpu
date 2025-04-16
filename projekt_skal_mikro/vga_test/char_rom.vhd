--------------------------------------------------------------------------------
-- CHAR_ROM
-- Version 2.0: 2023-01-12, Petter Kallstrom. ROM part of VGA_MOTOR.
-- Description:
-- * This is just a single-port ROM, that contains the images of all characters
-- Version 3.0: 2023-09-29, Anders Nilsson. 12-bit ROM. 

-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;            -- basic IEEE library
use IEEE.NUMERIC_STD.ALL;               -- IEEE library for the unsigned type


-- entity
entity char_rom is
	port (
		clk      : in std_logic;
		addr     : in unsigned(11 downto 0);
		data     : out std_logic_vector(11 downto 0));
end char_rom;


-- architecture
architecture Behavioral of char_rom is
	type rom_t is array (0 to 3071) of std_logic_vector(11 downto 0);
	signal rom_data : rom_t;

begin

	-- Read from the ROM:
	process(clk)
	begin
		if rising_edge(clk) then
			data <= rom_data(to_integer(addr));
		end if;
	end process;
	
	rom_data <= (
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- 0 (VIT BAKGROUND)
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", --
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", --
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- 

		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", -- 2
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"FFF", x"FFF", x"FFF", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"FFF", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"FFF", x"FFF", x"FFF", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"FFF", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"FFF", x"FFF", x"FFF", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", 
		x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE", x"EEE",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",

		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", -- 4
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"FFF", x"DDF", x"FFF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF",
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"FFF", x"DDF", x"FFF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"FFF", x"FFF", x"FFF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"FFF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF",  
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"FFF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", 
		x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF", x"DDF",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", -- 8
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"FFF", x"FFF", x"FFF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF",
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"FFF", x"CCF", x"FFF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"FFF", x"FFF", x"FFF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"FFF", x"CCF", x"FFF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"FFF", x"FFF", x"FFF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", 
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF",
		x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF", x"CCF",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", -- 16
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"FFF", x"CCE", x"FFF", x"FFF", x"FFF", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"FFF", x"CCE", x"FFF", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"FFF", x"CCE", x"FFF", x"FFF", x"FFF", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"FFF", x"CCE", x"FFF", x"CCE", x"FFF", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"FFF", x"CCE", x"FFF", x"FFF", x"FFF", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", 
		x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE", x"CCE",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", -- 32
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"FFF", x"FFF", x"FFF", x"CBD", x"FFF", x"FFF", x"FFF", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"FFF", x"CBD", x"CBD", x"CBD", x"FFF", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"FFF", x"FFF", x"FFF", x"CBD", x"FFF", x"FFF", x"FFF", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"FFF", x"CBD", x"FFF", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"FFF", x"FFF", x"FFF", x"CBD", x"FFF", x"FFF", x"FFF", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", 
		x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD", x"CBD",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",

		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", -- 64
		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"FFF", x"FFF", x"FFF", x"DBD", x"FFF", x"DBD", x"FFF", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"FFF", x"DBD", x"DBD", x"DBD", x"FFF", x"DBD", x"FFF", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"FFF", x"FFF", x"FFF", x"DBD", x"FFF", x"FFF", x"FFF", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"FFF", x"DBD", x"FFF", x"DBD", x"DBD", x"DBD", x"FFF", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"FFF", x"FFF", x"FFF", x"DBD", x"DBD", x"DBD", x"FFF", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", 
		x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD", x"DBD",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", -- 128
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FFF", x"FFF", x"FFF", x"FDC", x"FFF", x"FFF", x"FFF", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FFF", x"FDC", x"FFF", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FFF", x"FFF", x"FFF", x"FDC", x"FFF", x"FFF", x"FFF", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FFF", x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FFF", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FFF", x"FDC", x"FFF", x"FFF", x"FFF", x"FDC", x"FFF", x"FFF", x"FFF", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", 
		x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC", x"FDC",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",

		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", -- 256
		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FC9", x"FC9", x"FFF", x"FC9", x"FFF", x"FC9", x"FC9", x"FC9", x"FFF", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FFF", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FFF", x"FC9", x"FFF", x"FC9", x"FFF", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FFF", x"FFF", x"FFF", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", 
		x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9", x"FC9",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", -- 512
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FFF", x"FFF", x"FFF", x"FB8", x"FFF", x"FB8", x"FFF", x"FFF", x"FFF", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FFF", x"FB8", x"FB8", x"FB8", x"FFF", x"FB8", x"FB8", x"FB8", x"FFF", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FFF", x"FFF", x"FFF", x"FB8", x"FFF", x"FB8", x"FFF", x"FFF", x"FFF", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FFF", x"FB8", x"FFF", x"FB8", x"FFF", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FFF", x"FFF", x"FFF", x"FB8", x"FFF", x"FB8", x"FFF", x"FFF", x"FFF", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", 
		x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8", x"FB8",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", -- 1024
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", 
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", 
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", 
		x"EA6", x"FFF", x"EA6", x"FFF", x"FFF", x"FFF", x"EA6", x"FFF", x"FFF", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"EA6", 
		x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"EA6", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"EA6", 
		x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"FFF", x"FFF", x"EA6", x"FFF", x"FFF", x"FFF", x"EA6", x"EA6", 
		x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"FFF", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"FFF", x"EA6", x"EA6", 
		x"EA6", x"FFF", x"EA6", x"FFF", x"FFF", x"FFF", x"EA6", x"FFF", x"FFF", x"FFF", x"EA6", x"EA6", x"EA6", x"FFF", x"EA6", x"EA6", 
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", 
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", 
		x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6", x"EA6",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", -- 2048 
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", 
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", 
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", 
		x"DC4", x"FFF", x"FFF", x"FFF", x"DC4", x"FFF", x"FFF", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"FFF", x"FFF", 
		x"DC4", x"DC4", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", 
		x"DC4", x"FFF", x"FFF", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", x"FFF", x"FFF", x"DC4", x"FFF", x"FFF", x"FFF", 
		x"DC4", x"FFF", x"DC4", x"DC4", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"DC4", x"DC4", x"FFF", x"DC4", x"FFF", x"DC4", x"FFF", 
		x"DC4", x"FFF", x"FFF", x"FFF", x"DC4", x"FFF", x"FFF", x"FFF", x"DC4", x"DC4", x"DC4", x"FFF", x"DC4", x"FFF", x"FFF", x"FFF", 
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", 
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", 
		x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4", x"DC4",

		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", -- OFFSET, TA INTE BORT
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000",
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000"
	);
	
end Behavioral;

