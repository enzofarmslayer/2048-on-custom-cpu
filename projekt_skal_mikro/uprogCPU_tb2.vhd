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
    data_out : OUT std_logic_vector(3 downto 0);  -- Tile data output
    addr_out : OUT unsigned(3 downto 0);  -- Tile address output
    weCPU    : OUT std_logic;              -- Write enable output
    vram_in : IN std_logic_vector(3 downto 0)
  );
  END COMPONENT;

  -- Inputs to the UUT
  signal clk      : std_logic := '0';
  signal rst      : std_logic := '0';
  signal ScanCode : std_logic_vector(7 downto 0) := (others => '0');  -- scancode input
  signal make_op  : std_logic := '0';  -- make operation signal
  signal vram_in : std_logic_vector(3 downto 0) := (others => '0');

  -- Outputs from the UUT
  signal data_out : std_logic_vector(3 downto 0);
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
      weCPU => weCPU,
      vram_in => vram_in
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

   -- Stimulate the input signals
   process
   begin
     -- Wait for a few clock cycles for reset to be deasserted
     wait for 20 ns;
 
     -- Apply ScanCode and make_op values for the test
     ScanCode <= x"1C";  -- Set ScanCode to 0x1D (the value to test)
     make_op <= '1';     -- Trigger make_op
 
     -- Wait for a few clock cycles to observe behavior
     wait for 20 ns;
 
     -- Assert make_op low to end the operation
     make_op <= '0';
 
     -- Wait for some more cycles to check the result
     wait for 50 ns;
 
     -- End of test
     wait;
   end process;
END func;
