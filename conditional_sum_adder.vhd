library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.components.all;


entity conditional_sum_adder is
port(A,B : in Std_Logic_Vector(7 downto 0); 
	CI : in Std_Logic; 
	SUB : in Std_Logic; 
	S : out Std_Logic_Vector(7 downto 0); 
	N : out Std_Logic; 
	Z : out Std_Logic; 
	V : out Std_Logic; 
	LT : out Std_Logic; 
	CO : out Std_Logic); 
end conditional_sum_adder;

architecture Behavioral of conditional_sum_adder is
signal NN : Std_Logic; 
signal VV : Std_Logic; 
signal G,P,BB,SS,C : Std_Logic_Vector(7 downto 0); 
begin 
process(B,SUB) 
begin 
if SUB = '0' then 
BB <= B; 
else 
BB <= not B; 
end if; 
end process; 
preprocessing: ppgpgen 
generic map(8) port map(A,BB,CI,G,P); 
sk: ppa_sk_adder 
generic map (8,3) port map (G,P,CI,SS,CO,C); 
zero: fac0 generic map(8)  port map (A,BB,P,CI,Z); 
S <= SS; 
VV <= C(7) xor C(7-1); 
V <= VV; 
NN <= SS(7); 
N <= NN; 
LT <= NN xor VV; 

end Behavioral;

