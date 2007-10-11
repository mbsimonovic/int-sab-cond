----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:24:09 10/09/2007 
-- Design Name: 
-- Module Name:    csa16b - Behavioral 
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
generic (wordLength: INTEGER :=32; logWordLength: INTEGER :=5);
	port(A,B : in Std_Logic_Vector (wordLength-1 downto 0); 
			CI : in Std_Logic; 
			OP: in STD_LOGIC;
			S : out Std_Logic_Vector(wordLength-1 downto 0);
			COUT : out Std_Logic;
			Overflow: out STD_LOGIC);
end csa;

architecture Behavioral of csa is

TYPE matrica IS 
	ARRAY (0 TO 2) OF STD_LOGIC_VECTOR(wordLength-1 DOWNTO 0); 
	--prva vrsta matrice cuva inicijalne sume i prenose
	--druga vrsta matrice prihvata sracunate sume i prenose
SIGNAL S0, S1, C0,C1: matrica;
SIGNAL BComplemented : STD_LOGIC_VECTOR(wordLength-1 DOWNTO 0);

begin

process (B, OP)
begin
	if ( OP = '0' ) then
		BComplemented <= B;
	else 
		BComplemented <= not B;
	end if;
end process;

preprocessing: preprocessor generic map (wordLength) port map(
				A=>A, 
				B=>BComplemented, 
				ZeroSum=>S0(0), 
				OneSum=>S1(0), 
				ZeroCarry=>C0(0),
				OneCarry=>C1(0)
			);

carry_sum_calculation: parallel_carry_sum_generator generic map(wordLength,logWordLength) port map(
				ZeroSum=>S0(0), 
				OneSum=>S1(0), 
				ZeroCarry=>C0(0),
				OneCarry=>C1(0), 
				ZeroSumFinal=>S0(1), 
				OneSumFinal=>S1(1), 
				ZeroCarryFinal=>C0(1), 
				OneCarryFinal=>C1(1)
			);

postprocessing: postprocessor  generic map (wordLength) port map(
				ZeroSum=>S0(1),
				OneSum=>S1(1), 
				CI=>CI,
				OP=>OP, 
				ZeroCarry=>C0(1)(wordLength-1), 
				OneCarry=>C1(1)(wordLength-1), 
				PrevZeroCarry=>C0(1)(wordLength-1-1), 
				PrevOneCarry =>C1(1)(wordLength-1-1), 
				S =>S, 
				COUT=>COUT, 
				Overflow =>Overflow
			);

end Behavioral;
