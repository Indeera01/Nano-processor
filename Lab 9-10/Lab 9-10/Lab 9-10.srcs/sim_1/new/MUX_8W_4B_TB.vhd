----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:35:32 PM
-- Design Name: 
-- Module Name: MUX_8W_4B_TB - Behavioral
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

entity MUX_8W_4B_TB is
--  Port ( );
end MUX_8W_4B_TB;

architecture Behavioral of MUX_8W_4B_TB is

component MUX_8W_4B
    Port ( Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           RegOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, RegOut :  STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RegSel : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT : MUX_8W_4B PORT MAP (
           Reg0 => Reg0,
           Reg1 => Reg1,
           Reg2 => Reg2,
           Reg3 => Reg3,
           Reg4 => Reg4,
           Reg5 => Reg5,
           Reg6 => Reg6,
           Reg7 => Reg7,
           RegSel => RegSel,
           RegOut => RegOut);


    process begin 
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
        
        Reg0 <= "1010";
        Reg1 <= "0101";
        Reg2 <= "0100";
        Reg3 <= "1110";
        Reg4 <= "0111";
        Reg5 <= "0110";
        Reg6 <= "0011";
        Reg7 <= "1011";
        RegSel <= "000";
        wait for 100ns;

        RegSel <= "001";
        wait for 100ns;        

        RegSel <= "010";
        wait for 100ns;
        
        RegSel <= "011";
        wait for 100ns;
        
        RegSel <= "100";
        wait for 100ns;       

        RegSel <= "101";
        wait for 100ns;        
 
        RegSel <= "110";
        wait for 100ns; 

        RegSel <= "111";
        wait;
        
    end process;


end Behavioral;
