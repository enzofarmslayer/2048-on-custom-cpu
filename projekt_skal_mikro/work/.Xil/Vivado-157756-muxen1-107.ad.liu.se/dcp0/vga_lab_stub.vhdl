-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_lab is
  Port ( 
    clk : in STD_LOGIC;
    btnC : in STD_LOGIC;
    Hsync : out STD_LOGIC;
    Vsync : out STD_LOGIC;
    vgaRed : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vgaGreen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vgaBlue : out STD_LOGIC_VECTOR ( 3 downto 0 );
    PS2Clk : in STD_LOGIC;
    PS2Data : in STD_LOGIC
  );

end vga_lab;

architecture stub of vga_lab is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
