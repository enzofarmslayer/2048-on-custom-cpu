
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

    constant PS2_HALF_PERIOD : time := 10 ns;         -- 20 kHz ≈ 50 µs total
    type bit_array is array (natural range <>) of std_logic;

    -- 0x1C  = 0001_1100  →  LSb-first: 0 0 1 1 1 0 0 0
    -- three 1s  ⇒ parity bit must be 0 (odd parity keeps count odd)
    constant make_A : bit_array :=
      ( '0',                   -- start
        '0','0','1','1','1','0','0','0',   -- data[0] … data[7]
        '0',                   -- parity
        '1' );                 -- stop

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

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: Reset signal
        btnC <= '1';  -- Apply reset
        wait for 20 ns;
        btnC <= '0';  -- Remove reset
        wait for 20 ns;

        for i in make_A'range loop
            PS2Data <= make_A(i);             -- put bit on the line

            PS2Clk  <= '0';                   -- start this clock pulse
            wait for PS2_HALF_PERIOD;         -- data sampled on FALLING edge
            PS2Clk  <= '1';
            wait for PS2_HALF_PERIOD;         -- complete the pulse
        end loop;

        -- release the lines (idle = both high)
        PS2Data <= '1';
        PS2Clk  <= '1';

        -- Test 3: Verify VGA output signals (just for observation)
        wait for 100 ns;

        -- End simulation
        wait;
    end process;

end architecture behavior;