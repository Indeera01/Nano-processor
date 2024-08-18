----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 08:41:29 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           S_out : out STD_LOGIC_VECTOR (2 downto 0));
end RCA_3;

architecture Behavioral of RCA_3 is

component FA
    port(
    A: in std_logic;
    B: in std_logic;
    C_in : in std_logic;
    S : out std_logic;
    C_out : out std_logic);
end component;

SIGNAL C0, C1, C2, Carry : std_logic;
SIGNAL S : std_logic_vector(2 downto 0);

begin

    FA_0 : FA
        port map(
        A => '1',
        B => I(0),
        C_in => '0', -- grounded
        S => S(0),
        C_out => C0);

    FA_1 : FA
        port map(
        A => '0',
        B => I(1),
        C_in => C0,
        S => S(1),
        C_out => C1);

    FA_2 : FA
        port map(
        A => '0',
        B => I(2),
        C_in => C1,
        S => S(2),
        C_out => C2);
        
    S_out <= S;
    Carry <= C2;

end Behavioral;
