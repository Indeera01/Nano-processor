----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 06:17:37 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( CLK : in STD_LOGIC;
           Res : in STD_LOGIC;
           Zero: out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Reg7_LED: out STD_LOGIC_VECTOR (3 downto 0);
           Reg7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0):= "1110");
end NanoProcessor;

architecture Behavioral of NanoProcessor is

    component Instruction_Decoder
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
    end component;
    
    component RegBank   
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               CLK : in STD_LOGIC;
               Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
               Res : in STD_LOGIC;
               Q0 : out STD_LOGIC_VECTOR (3 downto 0);
               Q1 : out STD_LOGIC_VECTOR (3 downto 0);
               Q2 : out STD_LOGIC_VECTOR (3 downto 0);
               Q3 : out STD_LOGIC_VECTOR (3 downto 0);
               Q4 : out STD_LOGIC_VECTOR (3 downto 0);
               Q5 : out STD_LOGIC_VECTOR (3 downto 0);
               Q6 : out STD_LOGIC_VECTOR (3 downto 0);
               Q7 : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component ProgROM
        Port ( M_Sel : in STD_LOGIC_VECTOR (2 downto 0);
               Instruction : out STD_LOGIC_VECTOR (11 downto 0));
    end component;    

    component PC_3
        Port ( D : in STD_LOGIC_VECTOR (2 downto 0) := "000";
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0) := "000");
    end component; 
    
    component ASU_4
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               AS_Sel : in STD_LOGIC:='0';
               ASU_EN : in STD_LOGIC;
               Sum : out STD_LOGIC_VECTOR (3 downto 0);
               Carry : out STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;      

    component RCA_3
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0) := "000";
               S_out : out STD_LOGIC_VECTOR (2 downto 0) := "000");
    end component;

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

    component MUX_2W_3B
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0) := "000";
               B : in STD_LOGIC_VECTOR (2 downto 0) := "000";
               Sel : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (2 downto 0) := "000");
    end component;

    component MUX_2W_4B
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
               data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;   
    
    component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;  

SIGNAL CLK_Slow, Load_Sel, AS_Sel, Jump_Flag, Carry, ASU_EN : STD_LOGIC;
SIGNAL Instruction : STD_LOGIC_VECTOR (11 downto 0);
SIGNAL A_Out, Im_Val, ASU_4_Sum, D, B_Out : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_EN, Reg_Sel_A, Reg_Sel_B, Jump_Address, M_Sel,Incremented_Address : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Next_Address : STD_LOGIC_VECTOR (2 downto 0) := "000";

begin

Slow_Clk_0 : Slow_Clk port map (
    Clk_in => CLK,
    Clk_out => CLK_Slow);

Instruction_Decoder_0 : Instruction_Decoder port map (
    Instruction => Instruction,
    Reg_Check_J => A_Out,
    Reg_EN => Reg_EN,
    Load_Sel => Load_Sel,
    Im_Val => Im_Val,
    Reg_Sel_1 => Reg_Sel_A,
    Reg_Sel_2 => Reg_Sel_B,
    Add_Sub_Sel => AS_Sel,
    Jump_Flag => Jump_Flag,
    ASU_EN => ASU_EN,
    Jump_Address => Jump_Address);
    
    
MUX_2W_4B_0 : MUX_2W_4B port map ( -- MUX to select Data to be sent to registers
    A => ASU_4_Sum,
    B => Im_Val,
    Sel => Load_Sel,
    Y => D);

Add_Sub_Unit : ASU_4 port map (
    A => A_Out,
    B => B_Out,
    AS_Sel => AS_Sel,
    ASU_EN => ASU_EN,
    Sum => ASU_4_Sum,
    Carry => Carry,
    Overflow => Overflow,
    Zero => Zero);

MUX_8W_4B_A : MUX_8W_4B port map ( 
    Reg0 => Reg0,
    Reg1 => Reg1,
    Reg2 => Reg2,
    Reg3 => Reg3,
    Reg4 => Reg4,
    Reg5 => Reg5,
    Reg6 => Reg6,
    Reg7 => Reg7,
    RegSel => Reg_Sel_A,
    RegOut => A_Out);


MUX_8W_4B_B : MUX_8W_4B port map ( 
    Reg0 => Reg0,
    Reg1 => Reg1,
    Reg2 => Reg2,
    Reg3 => Reg3,
    Reg4 => Reg4,
    Reg5 => Reg5,
    Reg6 => Reg6,
    Reg7 => Reg7,
    RegSel => Reg_Sel_B,
    RegOut => B_Out);
  
Adder_3bit : RCA_3 port map (
    I => M_Sel,
    S_out => Incremented_Address);
    
   
    
MUX_2W_3B_0 : MUX_2W_3B port map ( -- to select the address of the next instruction
    A => Incremented_Address,
    B => Jump_Address,
    Sel => Jump_Flag,
    Y => Next_Address);
    
Program_Counter :  PC_3 port map (
    D => Next_Address,
    Res => Res,
    Clk => CLK_Slow,
    Q => M_Sel);
    
Program_ROM : ProgROM port map (
    M_Sel => M_Sel,
    Instruction => Instruction);

Register_bank : RegBank port map (
    D => D,
    CLK => CLK_Slow,
    Reg_EN => Reg_EN,
    Res => Res,
    Q0 => Reg0,
    Q1 => Reg1,
    Q2 => Reg2,
    Q3 => Reg3,
    Q4 => Reg4,
    Q5 => Reg5,
    Q6 => Reg6,
    Q7 => Reg7);
    
LUT_7Seg : LUT_16_7 port map (
    address => Reg7,
    data => Reg7_7Seg);
    
Reg7_LED <= Reg7;

end Behavioral;
