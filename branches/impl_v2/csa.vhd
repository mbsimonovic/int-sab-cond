----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:44 10/09/2007 
-- Design Name: 
-- Module Name:    csa - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use work.components.all;


entity csa is
	port(A,B : in Std_Logic_Vector(8-1 downto 0); 
		CI : in Std_Logic; 
		OP: in STD_LOGIC;
		S : out Std_Logic_Vector(8-1 downto 0);
		COUT : out Std_Logic;
		Overflow: out STD_LOGIC);
end csa;

architecture Behavioral of csa is

TYPE matrica IS 
	ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(8-1 DOWNTO 0); 
SIGNAL S0, S1, C0,C1: matrica;
SIGNAL BComplemented : STD_LOGIC_VECTOR(8-1 DOWNTO 0);

begin

process (B, OP)
begin
	if ( OP = '0' ) then
		BComplemented <= B;
	else 
		BComplemented <= not B;
	end if;
end process;

preprocessing: preprocessor port map(A=>A, B=>B, 
			ZeroSum=>S0(0), OneSum=>S1(0), ZeroCarry=>C0(0),OneCarry=>C1(0));

carry_sum_calculation: 
parallel_carry_sum_generator generic map(8,3) port map(
	ZeroSum=>S0(0), OneSum=>S1(0), ZeroCarry=>C0(0),OneCarry=>C1(0), 
	ZeroSumFinal=>S0(3), OneSumFinal=>S1(3), ZeroCarryFinal=>C0(3), OneCarryFinal=>C1(3));

postprocessing: postprocessor port map(
	ZeroSum=>S0(3),OneSum=>S1(3), 
	CI=>CI,OP=>OP, ZeroCarry=>C0(3)(7), 
		OneCarry=>C1(3)(7), PrevZeroCarry=>C0(3)(7-1), 
		PrevOneCarry =>C1(3)(7-1), 
	S =>S, COUT=>COUT, Overflow =>Overflow);

end Behavioral;

