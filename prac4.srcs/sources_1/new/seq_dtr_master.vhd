----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2020 19:19:49
-- Design Name: 
-- Module Name: seq_dtr_master - Behavioral
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

entity seq_dtr_master is
    Port ( X : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Z : out STD_LOGIC);
end seq_dtr_master;

architecture Behavioral of seq_dtr_master is

    -- SIGNAL DECLARATIONS --
    signal internal_clk  : STD_LOGIC;
    signal internal_rst  : STD_LOGIC;
    signal internal_data : STD_LOGIC;
    
    -- COMPONENT DECLARAIONS --
    component seq_dtr_moore port (
           X : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Z : out STD_LOGIC);
    end component;
    
    component output_hold_mealy port (
           X : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Z : out STD_LOGIC);
    end component;
    
begin

    internal_clk <= CLK;
    internal_rst <= RST;
    
    detector : seq_dtr_moore port map (
        X   => X,
        CLK => internal_clk,
        RST => internal_rst,
        Z   => internal_data);

    holder : output_hold_mealy port map (
        X   => internal_data,
        RST => internal_rst,
        CLK => internal_clk,
        Z   => Z);

end Behavioral;