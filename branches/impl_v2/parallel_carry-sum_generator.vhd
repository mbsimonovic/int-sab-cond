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


entity parallel_carry-sum_generator is
generic (wordLength: INTEGER; logWordLength: INTEGER);
port(
	ZeroSum,OneSum : in Std_Logic_Vector(wordLength-1 downto 0); --inicijalne sume
	ZeroCarry,OneCarry: in Std_Logic_Vector(wordLength-1 downto 0));--inicijalni prenosi
end parallel_carry-sum_generator;

architecture Behavioral of parallel_carry-sum_generator is

TYPE matrica IS ARRAY (0 TO logWordLength) OF STD_LOGIC_VECTOR(wordLength-1 DOWNTO 0); 
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
--levi blok se dobija selekcijom odgovarajuceg dela sume
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
end Behavioral;
