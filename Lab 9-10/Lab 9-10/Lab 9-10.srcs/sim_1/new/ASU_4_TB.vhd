----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:30:45 AM
-- Design Name: 
-- Module Name: ASU_4_TB - Behavioral
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

entity ASU_4_TB is
--  Port ( );
end ASU_4_TB;

architecture Behavioral of ASU_4_TB is

component ASU_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AS_Sel : in STD_LOGIC;
           ASU_EN : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

SIGNAL A, B, Sum : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL AS_Sel, Carry, Zero, Overflow, ASU_EN : STD_LOGIC;

begin

   UUT : ASU_4 PORT MAP (
            A => A,
            B => B,
            AS_Sel => AS_Sel,
            ASU_EN => ASU_EN,
            Sum => Sum,
            Carry => Carry,
            Overflow => Overflow,
            Zero => Zero);
        
    process begin 
    
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
        
        ASU_EN <= '0';
        
        A <= "1010";
        B <= "0101";
        AS_Sel <= '0';
        wait for 100ns;
        
        AS_Sel <= '1';
        wait for 100ns;
        
        ASU_EN <= '1';
        
        A <= "1010";
        B <= "0101";
        AS_Sel <= '0';
        wait for 100ns;
        
        AS_Sel <= '1';
        wait for 100ns;
        
        A <= "0100";
        B <= "1110";
        AS_Sel <= '0';
        wait for 100ns;
        
        AS_Sel <= '1';
        wait for 100ns;   
        
        A <= "0101";
        B <= "0110";
        AS_Sel <= '0';
        wait for 100ns;
        
        AS_Sel <= '1';
        wait for 100ns;   
        
        A <= "0011";
        B <= "0011";
        AS_Sel <= '0';
        wait for 100ns;
        
        A <= "0000";
        B <= "0001";
        AS_Sel <= '1';
        wait for 100ns;
        
        AS_Sel <= '1';
        wait;   
    end process;

end Behavioral;
