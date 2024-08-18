----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 11:53:50 AM
-- Design Name: 
-- Module Name: MUX_2W_4B - Behavioral
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

entity MUX_2W_4B is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2W_4B;

architecture Behavioral of MUX_2W_4B is

component Tri_Buffer_4
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           I_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL Y1, Y2 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL EN_A,EN_B : STD_LOGIC;

begin

    EN_A <= NOT(Sel);
    EN_B <= Sel;
    
    Buffer1 : Tri_Buffer_4
        port map (
        I => A,
        EN => EN_A,
        I_out => Y1);

    Buffer2 : Tri_Buffer_4
        port map (
        I => B,
        EN => EN_B,
        I_out => Y2);
        
    Y <= Y1 WHEN( Y2= "ZZZZ") ELSE Y2;


end Behavioral;
