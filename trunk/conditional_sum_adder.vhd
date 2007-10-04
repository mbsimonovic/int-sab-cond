library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.components.all;


entity conditional_sum_adder is
port(A,B : in Std_Logic_Vector(7 downto 0); 
	CI : in Std_Logic; 
	SUB : in Std_Logic; 
	S : out Std_Logic_Vector(7 downto 0); 
	CO : out Std_Logic); 
end conditional_sum_adder;

architecture Behavioral of conditional_sum_adder is
	signal G,P,BB,C : Std_Logic_Vector(7 downto 0); 
begin 
	process(B,SUB) 
	begin 
	if SUB = '0' then 
		BB <= B; 
	else 
		BB <= not B; 
	end if; 
	end process; 

	G(0) <= (CI and A(0)) or (CI and BB(0)) or 
	(A(0) and BB(0)); 
	P(0) <= A(0) xor BB(0); 

	square_cells : for sc in 1 to 7 generate
		G(sc) <= A(sc) and BB(sc);
		P(sc) <= A(sc) xor BB(sc);
	end generate square_cells; 

sk: ppa_sk_adder generic map (8,3) port map (G,P,CI,S,CO,C); 

end Behavioral;

