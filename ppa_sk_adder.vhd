library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.components.all;

entity ppa_sk_adder is
generic (n : integer; m : integer); 
	port (
	G,P: in STD_LOGIC_VECTOR (n-1 downto 0);
		CI : in Std_Logic; 
		S: out STD_LOGIC_VECTOR (n-1 downto 0);
		CO : out Std_Logic; 
		C : out STD_LOGIC_VECTOR (n-1 downto 0));
end ppa_sk_adder;

architecture ppa_sk_adder of ppa_sk_adder is

signal Gm,Gs : Std_Logic_Vector(n-1 downto 0); 
begin 
	sklansky : ppa_sk 
	generic map (n,m) 
	port map (G,P,Gm); 
	
	C <= Gm; 
	
		CO<=Gm(n-1);
		shl: for s in n-1 downto 1 generate
			Gs(s) <= Gm(s-1);
		end generate shl;
		Gs(0) <= CI;

	sum : 
		for su in n-1 downto 0 generate
			S(su) <= Gs(su) xor P(su);
		end generate sum;

end ppa_sk_adder;

