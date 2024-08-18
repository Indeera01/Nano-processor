----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:00:13 PM
-- Design Name: 
-- Module Name: MUX_8W_4B - Behavioral
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

entity MUX_8W_4B is
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
end MUX_8W_4B;

architecture Behavioral of MUX_8W_4B is

component Decoder_3_to_8
    port(
        I : IN STD_LOGIC_VECTOR(2 downto 0);
        EN : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR(7 downto 0));
end component;

component Tri_Buffer_4
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           I_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_EN : STD_LOGIC_VECTOR(7 downto 0);

begin

    Decoder: Decoder_3_to_8
        port map (
        I => RegSel,
        EN => '1',
        Y => Reg_EN);
        
    Buffer0 : Tri_Buffer_4
            port map (
            I => Reg0,
            EN => Reg_EN(0),
            I_out => Y0);

    Buffer1 : Tri_Buffer_4
            port map (
            I => Reg1,
            EN => Reg_EN(1),
            I_out => Y1);

    Buffer2 : Tri_Buffer_4
            port map (
            I => Reg2,
            EN => Reg_EN(2),
            I_out => Y2);

    Buffer3 : Tri_Buffer_4
            port map (
            I => Reg3,
            EN => Reg_EN(3),
            I_out => Y3);
            
    Buffer4 : Tri_Buffer_4
            port map (
            I => Reg4,
            EN => Reg_EN(4),
            I_out => Y4);

    Buffer5 : Tri_Buffer_4
            port map (
            I => Reg5,
            EN => Reg_EN(5),
            I_out => Y5);
            
    Buffer6 : Tri_Buffer_4
            port map (
            I => Reg6,
            EN => Reg_EN(6),
            I_out => Y6);            

    Buffer7 : Tri_Buffer_4
            port map (
            I => Reg7,
            EN => Reg_EN(7),
            I_out => Y7);
           
    RegOut <= Y0 WHEN( Y0 /= "ZZZZ") ELSE
              Y1 WHEN( Y1 /= "ZZZZ") ELSE
              Y2 WHEN( Y2 /= "ZZZZ") ELSE
              Y3 WHEN( Y3 /= "ZZZZ") ELSE
              Y4 WHEN( Y4 /= "ZZZZ") ELSE
              Y5 WHEN( Y5 /= "ZZZZ") ELSE
              Y6 WHEN( Y6 /= "ZZZZ") ELSE
              Y7 WHEN( Y7 /= "ZZZZ");
              
end Behavioral;
