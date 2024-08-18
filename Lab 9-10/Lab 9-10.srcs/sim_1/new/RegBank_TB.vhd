----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 04:27:43 PM
-- Design Name: 
-- Module Name: RegBank_TB - Behavioral
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

entity RegBank_TB is
--  Port ( );
end RegBank_TB;

architecture Behavioral of RegBank_TB is

component RegBank is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL Res, CLK : STD_LOGIC := '0';
SIGNAL D, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_EN : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT : RegBank PORT MAP (
        D => D,
        CLK => CLK,
        Reg_EN => Reg_EN,
        Res => Res,
        Q0 => Q0,
        Q1 => Q1,
        Q2 => Q2,
        Q3 => Q3,
        Q4 => Q4,
        Q5 => Q5,
        Q6 => Q6,
        Q7 => Q7 );
        
     process begin
        CLK <= NOT(CLK);
        wait for 3ns;
    end process;
    
    process begin
    
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101  
    
        D <= "1010";
        Reg_EN <= "101";
        wait for 100ns;
        
        D <= "0101";
        Reg_EN <= "100";
        wait for 100ns;
        
        D <= "1110";
        Reg_EN <= "110";
        wait for 100ns;

        Res <= '1';
        wait;
    
    end process;   


end Behavioral;
