library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- pMem interface
entity pMem is
  port(
    pAddr : in unsigned(15 downto 0);
    pData : out unsigned(15 downto 0));
end pMem;

architecture Behavioral of pMem is

-- program Memory --reg är fel
type p_mem_t is array (0 to 15) of unsigned(15 downto 0);
constant p_mem_c : p_mem_t :=
  (x"1001",
   x"1102",
   x"1203",
   x"1304",
   x"1405",
   x"1506",
   x"1607",
   x"2101",
   x"2000",
   x"2101",
   x"2202",
   x"2303",
   x"2404",
   x"2505",
   x"2606",
   x"3000");

  signal p_mem : p_mem_t := p_mem_c;


begin  -- pMem
  pData <= p_mem(to_integer(pAddr));

end Behavioral;
