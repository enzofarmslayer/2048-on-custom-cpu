library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- uMem interface
entity uMem is
  port (
    uAddr : in unsigned(5 downto 0);
    uData : out unsigned(22 downto 0));
end uMem;

architecture Behavioral of uMem is

-- micro Memory
type u_mem_t is array (0 to 15) of unsigned(22 downto 0);
constant u_mem_c : u_mem_t :=
   ---ALU_TB__FB_S_PC_SEQ_uAddr
  (b"0000_011_010_0_0_0000_0000000", -- PC->ASR
   b"0000_010_001_0_1_0000_0000000", -- PM->IR, PC+1
   b"0000_000_000_0_0_0001_0000000", -- K1->uPC
   b"0000_001_010_0_0_0000_0000000", -- LD / Mem(VR) -> GRx
   b"0000_010_100_0_0_0011_0000000", -- ..
   b"0000_001_100_0_0_0011_0000000", -- LDI / Const(PM) -> GRx
   b"0000_001_010_0_0_0000_0000000", -- STR / GRX -> VR(addr)
   b"0000_101_101_0_0_0011_0000000", -- ..
   b"0000_000_000_0_0_1111_0000000", -- HALT
   b"0001_000_000_0_0_0000_0000000", -- ADD
   b"0011_000_000_1_0_0000_0000000", -- ..
   b"0000_100_100_0_0_0011_0000000", -- ..
   b"0000_000_000_0_0_0000_0000000",
   b"0000_000_000_0_0_0000_0000000",
   b"0000_000_000_0_0_0000_0000000",
   b"0000_000_000_0_0_0000_0000000");

signal u_mem : u_mem_t := u_mem_c;

begin  -- Behavioral
  uData <= u_mem(to_integer(uAddr));

end Behavioral;
