----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 03:44:08 PM
-- Design Name: 
-- Module Name: RegBank - Behavioral
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

entity RegBank is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           CLK : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0):= "0000";
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end RegBank;

architecture Behavioral of RegBank is

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL R_EN : STD_LOGIC_VECTOR (7 downto 0);

begin

    Decoder : Decoder_3_to_8
    port map (
        I => Reg_EN,
        EN => '1',
        Y => R_EN );
        
    R0 : Reg
    port map (
        D => "0000",
        EN => R_EN(0),
        Clk => CLK,
        Q => Q0,
        Res => Res );
        
    R1 : Reg
    port map (
        D => D,
        EN => R_EN(1),
        Clk => CLK,
        Q => Q1,
        Res => Res );
        
    R2 : Reg
    port map (
        D => D,
        EN => R_EN(2),
        Clk => CLK,
        Q => Q2,
        Res => Res );
            
    R3 : Reg
    port map (
        D => D,
        EN => R_EN(3),
        Clk => CLK,
        Q => Q3,
        Res => Res );
        
    R4 : Reg
    port map (
        D => D,
        EN => R_EN(4),
        Clk => CLK,
        Q => Q4,
        Res => Res );
        
    R5 : Reg
    port map (
        D => D,
        EN => R_EN(5),
        Clk => CLK,
        Q => Q5,
        Res => Res );
        
    R6 : Reg
    port map (
        D => D,
        EN => R_EN(6),
        Clk => CLK,
        Q => Q6,
        Res => Res );
        
    R7 : Reg
    port map (
        D => D,
        EN => R_EN(7),
        Clk => CLK,
        Q => Q7,
        Res => Res );
        
end Behavioral;
