----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:02:29 AM
-- Design Name: 
-- Module Name: ASU_4 - Behavioral
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

entity ASU_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           ASU_EN : in STD_LOGIC;
           AS_Sel : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end ASU_4;

architecture Behavioral of ASU_4 is

component FA
    port(
    A: in std_logic;
    B: in std_logic;
    C_in : in std_logic;
    S : out std_logic;
    C_out : out std_logic);
end component;

SIGNAL B0, B1, B2, B3, S0, S1, S2, S3, C0, C1, C2, C3 : STD_LOGIC;

begin

    B0 <= AS_Sel XOR B(0);
    B1 <= AS_Sel XOR B(1);
    B2 <= AS_Sel XOR B(2);
    B3 <= AS_Sel XOR B(3);

    FA_0 : FA
        port map(
        A => A(0),
        B => B0,
        C_in => AS_Sel, -- add 1 to LSB if subtracting to covert to two's complement
        S => S0,
        C_out => C0);
        
    FA_1 : FA
        port map(
        A => A(1),
        B => B1,
        C_in => C0,
        S => S1,
        C_out => C1);

    FA_2 : FA
        port map(
        A => A(2),
        B => B2,
        C_in => C1, 
        S => S2,
        C_out => C2);
        
    FA_3 : FA
        port map(
        A => A(3),
        B => B3,
        C_in => C2,
        S => S3,
        C_out => C3);
        
    
    Carry <= C3;
    Overflow <= C3 AND ASU_EN;
    Sum(0) <= S0 AND ASU_EN;
    Sum(1) <= S1 AND ASU_EN;
    Sum(2) <= S2 AND ASU_EN;
    Sum(3) <= S3 AND ASU_EN;

    process (S0, S1, S2, S3) begin
        if (S0 = '0' and S1 = '0' and S2 = '0' and S3 = '0') then 
            Zero <= '1';
        else
            Zero <= '0'; 
        end if;
        
    end process;
end Behavioral;
