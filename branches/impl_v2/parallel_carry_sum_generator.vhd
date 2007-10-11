----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:56:17 10/09/2007 
-- Design Name: 
-- Module Name:    parallel_carry-sum_generator - Behavioral 
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


entity parallel_carry_sum_generator is
generic (wordLength: INTEGER :=32; logWordLength: INTEGER :=5);
port(
	ZeroSum,OneSum : in Std_Logic_Vector(wordLength-1 downto 0); --inicijalne sume
	ZeroCarry,OneCarry: in Std_Logic_Vector(wordLength-1 downto 0);--inicijalni prenosi
	ZeroSumFinal,OneSumFinal : out Std_Logic_Vector(wordLength-1 downto 0); --rezultat
	ZeroCarryFinal,OneCarryFinal : out Std_Logic_Vector(wordLength-1 downto 0)); --prenos
end parallel_carry_sum_generator;

architecture Behavioral of parallel_carry_sum_generator is

TYPE matrica IS ARRAY (0 TO logWordLength) OF STD_LOGIC_VECTOR(OneSum'range); 
SIGNAL S0, S1, C0,C1: matrica;

begin
--prva vrsta matrica je dobijena kroz ulazne signale:
S0(0) <= ZeroSum;
S1(0) <= OneSum;
C0(0) <= ZeroCarry;
C1(0) <= OneCarry;

across_rows:
for k in 0 to logWordLength-1 generate
	across_columns: for j in 1 to 2**(logWordLength-1-k) generate
	
	--deo bitova se dobija selekcijom:
	zero_carry_select: mux2x1  port map(
					C1(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1)),
					C0(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1)),
				C0(k)(2**(k+1)*j-1-(2**(k)-1) -1), 
					C0(k+1)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1)));	
	
	one_carry_select: mux2x1  port map(
					C1(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1)),
					C0(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1)),
					C1(k)(2**(k+1)*j-1-(2**(k)-1) -1), 
					C1(k+1)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1)));						
	
		--deo bitova se jednostavno prosledjuje:
	C0(k+1)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) 
		<= C0(k)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) ;
	C1(k+1)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) 
		<= C1(k)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) ;

--levi blok u sumama se dobija selekcijom odgovarajuceg dela 
	zero_select: 
	mux2x1  port map(
					S1(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))),
					S0(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1) ),
					C0(k)(2**(k+1)*j-1-(2**(k)-1) -1), 
					S0(k+1)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))));
	
	--desni blok se samo kopira
	S0(k+1)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) ) <=
					S0(k)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) );
					
	one_select: 
	mux2x1  port map(
					S1(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))),
					S0(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1) ),
					C1(k)(2**(k+1)*j-1-(2**(k)-1) -1), 
					S1(k+1)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))));
				
	S1(k+1)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) ) <=
					S1(k)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) );
				
	
end generate across_columns;
end generate across_rows;

ZeroSumFinal<=S0(logWordLength);
OneSumFinal<=S1(logWordLength);
ZeroCarryFinal<=C0(logWordLength);
OneCarryFinal<=C1(logWordLength);

end Behavioral;

