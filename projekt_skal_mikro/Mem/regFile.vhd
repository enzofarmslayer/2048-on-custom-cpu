library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity regFile is
  port (
    clk     : in  std_logic;
    we      : in  std_logic;                  -- Write enable
    wAddr   : in  unsigned(3 downto 0);       -- Write address
    wData   : in  unsigned(7 downto 0);       -- Data to write
    rAddr   : in  unsigned(3 downto 0);       -- Read address
    rData   : out unsigned(7 downto 0)        -- Data read
  );
end regFile;

architecture Behavioral of regFile is

  type reg_array_t is array (0 to 15) of unsigned(7 downto 0);
  signal registers : reg_array_t := (others => (others => '0'));

begin

  -- Synchronous write
  process(clk)
  begin
    if rising_edge(clk) then
      if we = '1' then
        registers(to_integer(wAddr)) <= wData;
      end if;
    end if;
  end process;

  -- Combinatorial read
  rData <= registers(to_integer(rAddr));

end Behavioral;
