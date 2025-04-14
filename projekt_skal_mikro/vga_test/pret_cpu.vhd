--------------------------------------------------------------------------------
-- PRETENDED_CPU
-- Version 1.0: See KBD_ENC.
-- Version 2.0: 2023-01-12. Petter Kallstrom. Changelog: Moved this to an own module
-- Description:
-- * This reads scancodes, and writes to the video RAM
-- * This module is instead of a CPU.

-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;            -- basic IEEE library
use IEEE.NUMERIC_STD.ALL;               -- IEEE library for the unsigned type
                                        -- and various arithmetic operations

-- entity
entity PRET_CPU is
	port (
		clk      : in std_logic;   -- system clock (100 MHz)
		rst      : in std_logic;   -- reset signal
		ScanCode : in std_logic_vector(7 downto 0);   -- scancode byte
		make_op  : in std_logic;                      -- one-pulsed scancode-enable
		data     : out std_logic_vector(7 downto 0);  -- tile data
		addr     : out unsigned(10 downto 0);         -- tile address
		we       : out std_logic);                    -- write enable
end PRET_CPU;

architecture behavioral of PRET_CPU is

    signal init_done    : std_logic := '0';
    signal write_index  : std_logic_vector(7 downto 0) := x"00";
    signal write_addr   : unsigned(10 downto 0) := (others => '0');

    constant TOTAL_TILE_COUNT : integer := 100;  -- tile indices x00 to x7F

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                write_index <= x"00";
                write_addr  <= (others => '0');
                init_done   <= '0';
                we          <= '0';
            elsif init_done = '0' then
                -- Write current tile index to video RAM
                we   <= '1';
                addr <= write_addr; -- Shift left logical by 2 = multiply by 4
                data <= write_index;

                -- Increment tile index and address
                write_index <= std_logic_vector(unsigned(write_index) + 1);
                write_addr  <= write_addr + 1;

                -- Stop when all tiles are written
                if unsigned(write_index) = to_unsigned(TOTAL_TILE_COUNT - 1, 8) then
                    init_done <= '1';
                end if;
            else
                we <= '0';
            end if;
        end if;
    end process;

end behavioral;



