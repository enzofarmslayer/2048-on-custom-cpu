LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY uprogCPU_tb2 IS
END uprogCPU_tb2;

ARCHITECTURE func OF uprogCPU_tb2 IS

  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT uprogCPU
  PORT(
    clk      : IN std_logic;
    rst      : IN std_logic;  -- Reset signal
    ScanCode : IN std_logic_vector(7 downto 0);  -- scancode byte
    make_op  : IN std_logic;  -- one-pulsed scancode-enable
    data_out : OUT unsigned(3 downto 0);  -- Tile data output
    addr_out : OUT unsigned(3 downto 0);  -- Tile address output
    weCPU    : OUT std_logic              -- Write enable output
  );
  END COMPONENT;

  -- Inputs to the UUT
  signal clk      : std_logic := '0';
  signal rst      : std_logic := '0';
  signal ScanCode : std_logic_vector(7 downto 0) := (others => '0');  -- scancode input
  signal make_op  : std_logic := '0';  -- make operation signal

  -- Outputs from the UUT
  signal data_out : unsigned(3 downto 0);
  signal addr_out : unsigned(3 downto 0);
  signal weCPU    : std_logic;

  -- Clock period definition
  constant clk_period : time := 10 ns;  -- 100 MHz clock

BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: uprogCPU
    PORT MAP (
      clk => clk,
      rst => rst,
      ScanCode => ScanCode,  -- connect the scancode signal
      make_op => make_op,    -- connect the make_op signal
      data_out => data_out,
      addr_out => addr_out,
      weCPU => weCPU
    );

  -- Clock process definition
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process;

  -- Reset signal stimulus (active high)
  rst <= '1', '0' after 17 ns;  -- Assert reset at time 0 and deassert after 20 ns

END func;
