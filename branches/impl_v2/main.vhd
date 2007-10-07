
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
port(A,B : in Std_Logic_Vector(8-1 downto 0); 
	CI : in Std_Logic; 
	S : out Std_Logic_Vector(8-1 downto 0); 
	COUT : out Std_Logic); 
end main;

architecture Behavioral of main is
component mux2x1 is
    Port ( A : in  STD_LOGIC_VECTOR ;--unconstrained
           B : in  STD_LOGIC_VECTOR ;
           CTRL : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR );
end component;
component konkatenator is
    Port ( A : in  STD_LOGIC_VECTOR; --unconstrained
           B : in  STD_LOGIC_VECTOR;
           c : out  STD_LOGIC_VECTOR);
end component;

TYPE matrica IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(8-1 DOWNTO 0);
SIGNAL  S0, S1, C0,C1: matrica;

begin

init: 
S0(0) <= A xor B; 
S1(0) <= not (A xor B);
C0(0) <= A AND B;
C1(0) <= A OR B;

obrada: 
	for k in 0 to 3-1 generate
	po_vrsti: for j in 1 to 2**(3-1-k) generate
	
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
	
	C0(k+1)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) 
		<= C0(k)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) ;
	C1(k+1)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) 
		<= C1(k)(2**(k+1)*j-1-(2**(k)-1) -1 downto 2**(k+1)*j-1-(2**(k)-1) -1-(2**(k)-1)) ;
	
	
	--levi blok se dobija selekcijom odgovarajuceg dela sume
	zero_select: 
	mux2x1  port map(
					S1(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))),
					S0(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1) ),
					C0(k)(2**(k+1)*j-1-(2**(k)-1) -1), --?
					S0(k+1)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))));
	
	--desni blok se samo kopira
	S0(k+1)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) ) <=
					S0(k)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) );
					
	one_select: 
	mux2x1  port map(
					S1(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))),
					S0(k)(2**(k+1)*j-1 downto 2**(k+1)*j-1-(2**(k)-1) ),
					C1(k)(2**(k+1)*j-1-(2**(k)-1) -1), --?
					S1(k+1)(2**(k+1)*j-1 downto 2**(k+1)*j-1-((2**(k)-1))));
				
	S1(k+1)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) ) <=
					S1(k)(2**(k+1)*j-1-(2**(k)-1) - 1 downto  2**(k+1)*j-1-(2**(k)-1)-1 - (2**(k)-1) );
				
	
end generate po_vrsti;

end generate obrada;				

--suma: mux2x1 port map(S0(3-1), S1(3-1), CI, S);
S<=S0(3);
--prenos: mux2x1 port map(C0(3-1), C1(3-1), CI, COUT);
process (C0(3)(7), C1(3)(7)) 
begin
	if (CI = '1') then
		COUT <= C1(3)(7);
	else
	COUT <= C0(3)(7);
	end if;
end process;
end Behavioral;

