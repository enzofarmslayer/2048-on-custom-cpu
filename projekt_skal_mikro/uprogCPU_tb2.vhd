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
    data_out : OUT unsigned(3 downto 0);  -- Tile data output
    addr_out : OUT unsigned(3 downto 0);  -- Tile address output
    weCPU    : OUT std_logic              -- Write enable output
  );
  END COMPONENT;

  -- Inputs to the UUT
  signal clk      : std_logic := '0';
  signal rst      : std_logic := '0';

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

  -- Additional test stimulus process
--   stimulus_process : process
--   begin
--     -- Wait for the reset to be deasserted
--     wait for 40 ns;

--     -- At this point, you can check the outputs of the UUT (uprogCPU)
--     -- You can also add more test cases if necessary
--     assert (data_out = "0000") report "Test failed for data_out" severity error;
--     assert (addr_out = "0000") report "Test failed for addr_out" severity error;
--     assert (weCPU = '0') report "Test failed for weCPU" severity error;

--     -- End simulation
--     wait for 50 ns;  -- Wait for a few more clock cycles
--     assert false report "Testbench complete" severity note;
--     wait;
--   end process;

END func;
