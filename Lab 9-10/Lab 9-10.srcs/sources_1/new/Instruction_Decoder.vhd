----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 06:59:12 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check_J : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           ASU_EN : out STD_LOGIC := '0';
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

    process(Instruction, reg_check_j) begin
        case Instruction(11 downto 10) is
        
            when "00" => 
                -- sending addresses of the register to be enabled
                Reg_Sel_1 <= Instruction(9 downto 7); 
                Reg_Sel_2 <= Instruction(6 downto 4); 
                Add_Sub_Sel <= '0';
                Reg_EN <= Instruction(9 downto 7); -- Enabling the register to store the answer
                Load_Sel <= '0'; -- selecting the output of the 4 bit Add sub unit (ASU_4)
                Jump_Flag <= '0';
                Im_Val <= "0000";
                Jump_Address <= "000";
                ASU_EN <= '1';
                
            when "01" =>
                Reg_Sel_2 <= Instruction(9 downto 7);
                Reg_Sel_1 <= "000";
                Reg_EN <= Instruction(9 downto 7);
                Add_Sub_Sel <= '1'; -- Enable subtractor
                ASU_EN <= '1';
                Load_Sel <= '0';
                Im_Val <= "0000";
                Jump_Flag <= '0';
                Jump_Address <= "000";
                
            when "10" =>
                Reg_EN <= Instruction(9 downto 7);
                Im_Val <= Instruction(3 downto 0);
                Load_Sel <= '1'; -- selecting the immediate value 
                Jump_Flag <= '0';
                reg_sel_2 <= "000";
                reg_sel_1 <= "000";
                Add_Sub_Sel <= '0';
                Jump_Address <= "000";
                
            when "11" => 
                Reg_Sel_1 <= Instruction(9 downto 7);
                reg_sel_2 <= "000";
                load_sel <= '0';
                Add_Sub_Sel <= '0';
                Im_Val <= "0000";
                reg_en <= "000"; 
                if (Reg_Check_J = "0000") then -- jump if value in register at Reg_Sel_1 is 0
                    Jump_Flag <= '1';
                    Jump_Address <= Instruction(2 downto 0);
                end if;
                
            when others =>
        end case;
    end process;
                
end Behavioral;
