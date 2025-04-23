--------------------------------------------------------------------------------
-- PRETENDED_CPU
-- Version 1.0: See KBD_ENC.
-- Version 2.0: 2023-01-12. Petter Kallstrom. Changelog: Moved this to an own module
-- Description:
-- * This reads scancodes, and writes to the video RAM
-- * This module is instead of a CPU.

-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;            -- basic IEEE library
use IEEE.NUMERIC_STD.ALL;               -- IEEE library for the unsigned type
                                        -- and various arithmetic operations

-- entity

entity uprogALU is 
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        TB      : in std_logic;
        FB      : in std_logic;

        Z_flag  : out std_logic;
        N_flag  : out std_logic;

    )
end uprogALU;

-- initialisation of Uprog, eith flags and registers etcetera.


architecture func of uprogALU is

    -- Zero and Negativ flags
    signal Z_flag_reg   :   std_logic;
    signal N_flag_reg   :   std_logic;

    
    
    
    
    
    
    
    
    
    process(clk)
        begin
            if rising_edge(clk) then
                if rst =  '1' then
                    Z_flag_reg <= '0';
                    N_flag_reg <= '0';
                else
                -------




                
