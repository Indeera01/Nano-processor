----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 08:52:10 PM
-- Design Name: 
-- Module Name: RCA_3_TB - Behavioral
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

entity RCA_3_TB is
--  Port ( );
end RCA_3_TB;

architecture Behavioral of RCA_3_TB is

component RCA_3
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           S_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL I, S_out : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT: RCA_3 PORT MAP (
            I => I,
            S_out => S_out);
            
            
    process begin
    
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
    
        I <= "010";
        wait for 100ns;
        
        I <= "101";
        wait for 100ns;
        
        I <= "001";
        wait for 100ns;
        
        I <= "100";
        wait;
        
    end process;

end Behavioral;
