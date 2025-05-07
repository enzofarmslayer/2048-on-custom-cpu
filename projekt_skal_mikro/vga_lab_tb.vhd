
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_lab_tb is
end entity vga_lab_tb;

architecture behavior of vga_lab_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component vga_lab
        port (
            clk      : in std_logic;
            btnC     : in std_logic;
            Hsync    : out std_logic;
            Vsync    : out std_logic;
            vgaRed   : out std_logic_vector(3 downto 0);
            vgaGreen : out std_logic_vector(3 downto 0);
            vgaBlue  : out std_logic_vector(3 downto 0);
            PS2Clk   : in std_logic;
            PS2Data  : in std_logic
        );
    end component;

    -- Inputs
    signal clk      : std_logic := '0';
    signal btnC     : std_logic := '0';
    signal PS2Clk   : std_logic := '1';
    signal PS2Data  : std_logic := '1';

    -- Outputs
    signal Hsync    : std_logic;
    signal Vsync    : std_logic;
    signal vgaRed   : std_logic_vector(3 downto 0);
    signal vgaGreen : std_logic_vector(3 downto 0);
    signal vgaBlue  : std_logic_vector(3 downto 0);

    -- Clock generation
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: vga_lab
        port map (
            clk => clk,
            btnC => btnC,
            Hsync => Hsync,
            Vsync => Vsync,
            vgaRed => vgaRed,
            vgaGreen => vgaGreen,
            vgaBlue => vgaBlue,
            PS2Clk => PS2Clk,
            PS2Data => PS2Data
        );

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    

end architecture behavior;