library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uprogALU is
    port(
        opcode  : in  unsigned(3 downto 0);
        rData   : in  unsigned(7 downto 0);  -- value from the register file
        AR_in   : in  unsigned(7 downto 0);  -- current accumulator contents
        AR_out  : out unsigned(7 downto 0);  -- pure combinational result
        Z_flag  : out std_logic;
        N_flag  : out std_logic
    );
end entity;

architecture comb of uprogALU is
    signal alu_result : unsigned(7 downto 0);  -- internal signal for ALU output
    signal rData_comp : unsigned(7 downto 0); -- two's complement of rData for subtraction
begin
    -- Perform two's complement of rData for unsigned subtraction
    rData_comp <= not rData + 1;  -- Two's complement

    -- Combinational logic for ALU result
    with opcode select
        alu_result <=
            AR_in                     when "0000",   -- NOP
            rData                     when "0001",   -- MOV  AR := rData
            (others => '0')           when "0010",   -- CLR  AR := 0
            AR_in + rData             when "0011",   -- ADD
            AR_in + rData_comp        when "0101",   -- SUB (using two's complement)
            AR_in                     when others;   -- default

    -- Assign internal result to output
    AR_out <= alu_result;

    -- Z and N flags based on alu_result
    Z_flag <= '1' when alu_result = 0 else '0';
end architecture;
