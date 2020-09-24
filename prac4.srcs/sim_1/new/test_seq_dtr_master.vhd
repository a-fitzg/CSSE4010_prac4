----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2020 20:35:10
-- Design Name: 
-- Module Name: test_seq_dtr_master - Behavioral
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

entity test_seq_dtr_master is
--  Port ( );
end test_seq_dtr_master;

architecture Behavioral of test_seq_dtr_master is

    component seq_dtr_master port( 
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

    u1 : seq_dtr_master port map (
        X => X,
        CLK => CLK,
        RST => RST,
        Z => Z);
    
    input_gen : process
    
    type dudd_list is array(0 to 7) of STD_LOGIC;
    type real_list is array(0 to 4) of STD_LOGIC;
    type repeating_list is array(0 to 3) of STD_LOGIC;
    
    constant dudd_seq : dudd_list :=
            ('0', '0', '1', '0', '0', '1', '0', '1');
    constant real_seq : real_list :=
            ('1', '1', '0', '0', '1');
    constant repeating_seq : repeating_list :=
            ('1', '1', '0', '0');
    
    
    begin
        RST <= '1';
        CLK <= '0';
        X <= '0';
        

        -- RST sequence
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

        CLK <= '0';
        RST <= '0';
        X <= '0';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;
        RST <= '1';
        
        -- And then the valid sequence
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

        CLK <= '0';
        X <= '1';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;



        wait;

        -- Just to line up the clock rising edges with the lines on the display
        wait for 1ps;
        
        -- First throw in some dudd sequence that shouldn't match
        for i in 0 to 7 loop
            CLK <= '0';
            X <= dudd_seq(i);
            wait for 1ps;
            CLK <= '1';
            wait for 1ps;
        end loop;
        
        -- Then send the real signal
        for i in 0 to 4 loop
            CLK <= '0';
            X <= real_seq(i);
            wait for 1ps;
            CLK <= '1';
            wait for 1ps;
        end loop;
        
        -- Followed by more junk
        for i in 0 to 7 loop
            CLK <= '0';
            X <= dudd_seq(i);
            wait for 1ps;
            CLK <= '1';
            wait for 1ps;
        end loop;
        
        -- Then send 3 of the correct sequences in a row to test for overlap
        for yeet in 0 to 2 loop
            for i in 0 to 3 loop
                CLK <= '0';
                X <= repeating_seq(i);
                wait for 1ps;
                CLK <= '1';
                wait for 1ps;
            end loop;
        end loop;

        CLK <= '0';
        X <= '1';
        wait for 1ps;
        CLK <= '1';
        wait for 1ps;

        -- And finish off with more junk
        for i in 0 to 7 loop
            CLK <= '0';
            X <= dudd_seq(i);
            wait for 1ps;
            CLK <= '1';
            wait for 1ps;
        end loop;



    end process;
    
end Behavioral;
