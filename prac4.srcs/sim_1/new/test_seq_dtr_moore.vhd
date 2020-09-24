----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2020 12:21:15
-- Design Name: 
-- Module Name: test_seq_dtr_moore - Behavioral
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

entity test_seq_dtr_moore is
--  Port ( );
end test_seq_dtr_moore;

architecture Behavioral of test_seq_dtr_moore is

    component seq_dtr_moore port( 
        X : in STD_LOGIC;
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Z : out STD_LOGIC);
    end component;
    
    signal X : STD_LOGIC;
    signal CLK : STD_LOGIC;
    signal RST : STD_LOGIC;
    signal Z : STD_LOGIC;
    
begin

    u1 : seq_dtr_moore port map (
        X => X,
        CLK => CLK,
        RST => RST,
        Z => Z);
    
    input_gen : process
    begin
        RST <= '0';
        CLK <= '0';
        X <= '0';
        
        --wait for 1ps;
        
        CLK <= '0';
        X <= '1';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;
        
        CLK <= '0';
        X <= '1';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;
        
        CLK <= '0';
        X <= '0';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;

        CLK <= '0';
        X <= '0';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;

        --CLK <= '0';
        --X <= '1';
        --wait for 1ps;
        --CLK <= '1';
        --wait for 1ps;

    end process;
end Behavioral;
