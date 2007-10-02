--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package components is

component fac0 is
	generic (n : integer); 
	port (A,B,P : in STD_LOGIC_VECTOR (n-1 downto 0);
	CI : in Std_Logic;
	E : out Std_Logic);
end component ;



component ppa_sk is
	generic (n: integer; m: integer);
	port( 
		G0, P0: in STD_LOGIC_VECTOR (n-1 downto 0);
		Gm: out STD_LOGIC_VECTOR (n-1 downto 0));
end component ;

component ppa_sk_adder is
generic (n : integer; m : integer);
	port (
	G,P: in STD_LOGIC_VECTOR (n-1 downto 0);
		CI : in Std_Logic;
		S: out STD_LOGIC_VECTOR (n-1 downto 0);
		CO : out Std_Logic;
		C : out STD_LOGIC_VECTOR (n-1 downto 0));
  
end component ;


  component ppgpgen is
	generic (n : integer);
	port (A,B: in STD_LOGIC_VECTOR (n-1 downto 0);
	CI : in Std_Logic;
	G,P: out STD_LOGIC_VECTOR (n-1 downto 0));
end component ;



component ppshl is 
	generic (n : integer); 
	port (GI : in STD_LOGIC_VECTOR (n-1 downto 0);
	CI : in Std_Logic; 
	GO : out STD_LOGIC_VECTOR (n-1 downto 0);
	COUT : out Std_Logic); 

end component ;


component ppsum is 
	generic (n : integer); 
	port (G, P : in STD_LOGIC_VECTOR (n-1 downto 0);
		S : out STD_LOGIC_VECTOR (n-1 downto 0));

end component ;
end components;

