----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 11:58:35 AM
-- Design Name: 
-- Module Name: MUX_2W_4B_TB - Behavioral
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

entity MUX_2W_4B_TB is
--  Port ( );
end MUX_2W_4B_TB;

architecture Behavioral of MUX_2W_4B_TB is

component MUX_2W_4B
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL A, B, Y : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Sel : STD_LOGIC;


begin

    UUT : MUX_2W_4B PORT MAP (
            A => A,
            B => B,
            Sel => Sel,
            Y => Y);

    process begin 
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
        
        A <= "1010";
        B <= "0101";
        Sel <= '0';
        wait for 400ns;
        
        Sel <= '1';
        wait;
        
    end process;

end Behavioral;
