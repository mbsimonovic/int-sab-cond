
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
           c : inout  STD_LOGIC_VECTOR);
end component;

signal C0,C1, BAFER1, BAFER2, BAFER3,BAFER4 : Std_Logic_Vector(8-1 downto 0); 
TYPE matrica IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(8-1 DOWNTO 0);
SIGNAL  S0, S1: matrica;

begin

S0(0) <= A xnor B; 
S1(0) <= not (A xnor B); 
C0 <= A AND B;
C1 <= A OR B;

obrada: for k in 0 to 3-1 generate
	
	po_vrsti: for j in 1 to 2**(3-1-k) generate
	
	prvi_red: konkatenator 
		port map(S0(k)(2*j-1 downto 2*j-1-((2**(k+1)-1)/2)),
					S0(k)(2*j-1-((2**(k+1)-1)/2) downto 2*j-1-(2**(k+1)-1)),
					BAFER1(2**(k+1)-1 downto 0));
--	drugi_red: konkatenator 
--		port map(S1(k)(2*j-1 downto 2*j-1-((2**(k+1)-1)/2)),
--					S0(k)(2*j-1-((2**(k+1)-1)/2) downto 2*j-1-(2**(k+1)-1)),
--					BAFER2(2**(k+1)-1 downto 0));
--	desni_mux: mux2x1  port map(
--					BAFER1(2**(k+1)-1 downto 0),
--					BAFER2(2**(k+1)-1 downto 0),
--					C0(2*j-1-1), 
--					S0(k+1)(2*j-1 downto 2*j-1-(2**(k+1)-1)));
					
--treci_red: konkatenator 
--		port map(S0(k)(2*j-1 downto 2*j-1-((2**(k+1)-1)/2)),
--					S1(k)(2*j-1-((2**(k+1)-1)/2) downto 2*j-1-(2**(k+1)-1)),
--					BAFER3(2**(k+1)-1 downto 0));
--	cetvrti_red: konkatenator 
--		port map(S1(k)(2*j-1 downto 2*j-1-((2**(k+1)-1)/2)),
--					S1(k)(2*j-1-((2**(k+1)-1)/2) downto 2*j-1-(2**(k+1)-1)),
--					BAFER4(2**(k+1)-1 downto 0));
--	levi_mux: mux2x1  port map(
--					BAFER3(2**(k+1)-1 downto 0),
--					BAFER4(2**(k+1)-1 downto 0),
--					C1(2*j-1-1), 
--					S1(k+1)(2*j-1 downto 2*j-1-(2**(k+1)-1)));					
	end generate po_vrsti;

end generate obrada;

--suma: mux2x1 port map(S0(3-1), S1(3-1), CI, S);
--cout<= '1';

end Behavioral;

