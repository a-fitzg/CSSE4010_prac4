----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2020 10:40:44
-- Design Name: 
-- Module Name: seq_dtr_moore - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seq_dtr_moore is
    Port ( X : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Z : out STD_LOGIC);
end seq_dtr_moore;

architecture Behavioral of seq_dtr_moore is

    type state_type is (S0, S1, S2, S3, S4, S5);
    signal state : state_type := S0;
    signal next_state : state_type := S0;

begin
    
    -- Next state detection logic --
    detector : process(state, X, CLK)
    begin
    
        case state is
            when S0 =>
                if X /= '1' then
                    next_state <= S0;
                    Z <= '0';
                else
                    next_state <= S1;
                    Z <= '0';
                end if;
            when S1 =>
                if X /= '1' then
                    next_state <= S0;
                    Z <= '0';
                else
                    next_state <= S2;
                    Z <= '0';
                end if;
            when S2 =>
                if X /= '1' then
                    next_state <= S3;
                    Z <= '0';
                else
                    next_state <= S2;
                    Z <= '0';
                end if;
            when S3 =>
                if X /= '1' then
                    next_state <= S4;
                    Z <= '0';
                else
                    next_state <= S1;
                    Z <= '0';
                end if;
            when S4 =>
                if X /= '1' then
                    next_state <= S0;
                    Z <= '0';
                else
                    next_state <= S5;
                    Z <= '1';
                end if;
            when S5 =>
                if X /= '1' then
                    next_state <= S0;
                    Z <= '0';
                else
                    -- Edge case
                    if (CLK = '1') then
                        Z <= '1';
                    else
                        Z <= '0';
                    end if;
                    next_state <= S2;
                end if;
        end case;
    end process;
    
    clocker : process (CLK)
    begin
        if RST = '0' then
            state <= S0;
        elsif (CLK'event and CLK = '1') then
            state <= next_state;
        end if;
    end process;
    
    --Z <= '1' when state = S5 else '0';

end Behavioral;
