----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 09:25:00 PM
-- Design Name: 
-- Module Name: PC_3_TB - Behavioral
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

entity PC_3_TB is
--  Port ( );
end PC_3_TB;

architecture Behavioral of PC_3_TB is

component PC_3
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL D, Q : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Res, Clk : STD_LOGIC := '0';

begin

    UUT : PC_3 PORT MAP (
        D => D,
        Res => Res,
        Clk => Clk,
        Q => Q);
        
    process begin
        Clk <= NOT(Clk);
        wait for 10ns;
    end process;
    
    process begin 
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
        
        D <= "010";
        wait for 100ns;
        
        Res <= '1';
        wait for 100ns;
        
        D <= "101";
        wait for 100ns;
        
        Res <= '1';
        wait for 100ns;
        
        Res <= '0';
        wait;
    end process;            


end Behavioral;
