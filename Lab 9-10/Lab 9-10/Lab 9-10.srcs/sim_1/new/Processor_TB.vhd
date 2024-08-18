----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 10:08:06 PM
-- Design Name: 
-- Module Name: Processor_TB - Behavioral
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

entity Processor_TB is
--  Port ( );
end Processor_TB;

architecture Behavioral of Processor_TB is

component NanoProcessor
    Port ( CLK : in STD_LOGIC;
           Res : in STD_LOGIC;
           Zero: out STD_LOGIC;
           Overflow: out STD_LOGIC;
           Reg7_LED: out STD_LOGIC_VECTOR (3 downto 0);
           Reg7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0):= "0111");
end component;

SIGNAL CLK, Res : STD_LOGIC := '0';
SIGNAL Overflow, Zero: STD_LOGIC;
SIGNAL Anode, Reg7_LED: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg7_7Seg : STD_LOGIC_VECTOR (6 downto 0);

begin

UUT : NanoProcessor PORT MAP (
    CLK => CLK,
    Res => Res,
    Zero => Zero,
    Overflow => Overflow,
    Reg7_LED => Reg7_LED,
    Reg7_7Seg => Reg7_7Seg,
    Anode => Anode);
    
    process begin
        CLK <= NOT(CLK);
        wait for 2ns;
    end process;  

    process begin
    
        Res <= '1';
        wait for 100ns;
        
        Res <= '0';
        wait;
        
    end process;

end Behavioral;
