----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 06:31:46 PM
-- Design Name: 
-- Module Name: ProgROM_TB - Behavioral
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

entity ProgROM_TB is
--  Port ( );
end ProgROM_TB;

architecture Behavioral of ProgROM_TB is

component ProgROM
    Port ( M_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

SIGNAL M_Sel : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Instruction : STD_LOGIC_VECTOR (11 downto 0);

begin

    UUT : ProgROM PORT MAP (
        M_Sel => M_Sel,
        Instruction => Instruction);

    Process begin
    
    -- 210250 -> 11 0011 0101 0100 1010 
    -- 210661 -> 11 0011 0110 1110 0101 
        M_Sel <= "010";
        wait for 300ns;
        
        M_Sel <= "101";
        wait for 300ns;

        M_Sel <= "001";
        wait;  
        
    end process;     

end Behavioral;
