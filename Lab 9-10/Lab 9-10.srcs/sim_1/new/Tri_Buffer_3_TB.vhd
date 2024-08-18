----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:41:54 AM
-- Design Name: 
-- Module Name: Tri_Buffer_3_TB - Behavioral
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

entity Tri_Buffer_3_TB is
--  Port ( );
end Tri_Buffer_3_TB;

architecture Behavioral of Tri_Buffer_3_TB is

component Tri_Buffer_3
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           I_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL I, I_out : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL EN : STD_LOGIC;

begin

    UUT : Tri_Buffer_3 PORT MAP (
            I => I,
            EN => EN,
            I_out => I_out);


    process begin
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
        EN <= '1';
        I <= "010";
        wait for 100ns;
        
        EN <= '0';
        wait for 100ns;
        
        I <= "101";
        wait for 100ns;
        
        EN <= '1';
        wait; 
        
    end process;
        
end Behavioral;
