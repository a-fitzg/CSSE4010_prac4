----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2020 10:14:28
-- Design Name: 
-- Module Name: output_hold_mealy - Behavioral
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

entity output_hold_mealy is
    Port ( X : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Z : out STD_LOGIC);
end output_hold_mealy;

architecture Behavioral of output_hold_mealy is

    type state_type is (S0, S1, S2);
    signal state : state_type := S0;
    signal next_state : state_type := S0;

begin

    clocker : process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '0' then
                state <= S0;
            else
                state <= next_state;
            end if;
        end if;
    end process;

    detector : process(state, X)
    begin
        case state is
            when S0 =>
                if X /= '1' then
                    next_state <= S0;
                else
                    next_state <= S1;
                end if;
                Z <= '0';
            when S1 =>
                if X /= '1' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
                Z <= '1';
            when S2 =>
                if X /= '1' then
                    next_state <= S0;
                else
                    next_state <= S1;
                end if;
                Z <= '1';
        end case;
    end process;

end Behavioral;