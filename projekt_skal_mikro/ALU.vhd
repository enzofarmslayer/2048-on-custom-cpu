library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uprogALU is 
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        opcode  : in unsigned(3 downto 0);      -- 4-bit operation code
        rData   : in unsigned(7 downto 0);      -- data from register file
        Z_flag  : out std_logic;
        N_flag  : out std_logic;
        result  : out unsigned(7 downto 0)      -- current value of accumulator (AR)
    );
end uprogALU;

architecture func of uprogALU is

    signal AR : unsigned(7 downto 0) := (others => '0');  -- Accumulator Register
    signal Z_flag_reg : std_logic := '0';
    signal N_flag_reg : std_logic := '0';

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                AR <= (others => '0');
                Z_flag_reg <= '0';
                N_flag_reg <= '0';
            else
                case opcode is
                    when "0000" =>  -- NOP
                        null;
                    when "0001" =>  -- AR := rData
                        AR <= rData;
                    when "0010" =>  -- AR := 0
                        AR <= (others => '0');
                    when "0011" =>  -- AR := AR + rData
                        AR <= AR + rData;
                    when others =>
                        null;
                end case;

                -- Update flags
                if AR = 0 then
                    Z_flag_reg <= '1';
                else
                    Z_flag_reg <= '0';
                end if;

                N_flag_reg <= AR(7);  -- sign bit
            end if;
        end if;
    end process;

    -- Outputs
    Z_flag <= Z_flag_reg;
    N_flag <= N_flag_reg;
    result <= AR;

end func;
