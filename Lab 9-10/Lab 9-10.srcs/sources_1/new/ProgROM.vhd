----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 05:04:37 PM
-- Design Name: 
-- Module Name: ProgROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgROM is
    Port ( M_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ProgROM;

architecture Behavioral of ProgROM is

    type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);
        SIGNAL program_ROM : rom_type := (
            "100010000011", -- MOVI R1,3
            "100100000001", -- MOVI R2,1
            "010100000000", -- NEG R2
            "001110010000", -- ADD R7,R1
            "000010100000", -- ADD R1,R2
            "110010000111", --JZR R1,7
            "110000000011", --JZR R0,3
            "110000000111"  -- NULL  
            );

begin

    Instruction <= program_ROM(to_integer(unsigned(M_Sel)));

end Behavioral;
