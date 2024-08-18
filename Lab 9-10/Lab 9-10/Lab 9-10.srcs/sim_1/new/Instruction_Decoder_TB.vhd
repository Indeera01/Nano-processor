----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 03:39:39 PM
-- Design Name: 
-- Module Name: Instruction_Decoder_TB - Behavioral
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

entity Instruction_Decoder_TB is
--  Port ( );
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is

component Instruction_Decoder 
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check_J : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           -- RCA_3_EN : out STD_LOGIC := '0';
           Jump_Flag : out STD_LOGIC; 
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end component;


SIGNAL Instruction : STD_LOGIC_VECTOR (11 downto 0);
SIGNAL Reg_Check_J, Im_Val : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_EN, Reg_Sel_1, Reg_Sel_2, Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Load_Sel, Add_Sub_Sel, Jump_Flag : STD_LOGIC;

begin

    UUT : Instruction_Decoder PORT MAP (
        Instruction => Instruction,
        Reg_Check_J => Reg_Check_J,
        Reg_EN => Reg_EN,
        Load_Sel => Load_Sel,
        Im_Val => Im_Val,
        Reg_Sel_1 => Reg_Sel_1,
        Reg_Sel_2 => Reg_Sel_2,
        Add_Sub_Sel => Add_Sub_Sel,
        Jump_Flag => Jump_Flag,
        Jump_Address => Jump_Address);
        
    process begin
    
        -- 210250 -> 11 0011 0101 0100 1010 
        -- 210661 -> 11 0011 0110 1110 0101
        Instruction <= "100010001010";
        wait for 200ns;

        Instruction <= "000010100000";
        wait for 200ns;       

        Instruction <= "010010000000";
        wait for 200ns; 
        
        Instruction <= "110010100000";
        Reg_Check_J <= "0000";
        wait for 200ns;      
    
    end process;           

end Behavioral;
