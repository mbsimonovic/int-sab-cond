----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:26 10/02/2007 
-- Design Name: 
-- Module Name:    ppa_sk_adder - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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

component ppa_sk is
	generic (n: integer; m: integer);
	port( 
		G0, P0: in STD_LOGIC_VECTOR (n-1 downto 0);
		Gm: out STD_LOGIC_VECTOR (n-1 downto 0));
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

signal Gm,Gs : Std_Logic_Vector(n-1 downto 0); 
begin 
	sklansky : ppa_sk 
	generic map (n,m) 
	port map (G,P,Gm); 
	C <= Gm; 

	shl : ppshl 
	generic map (n) 
	port map (Gm,CI,Gs,CO); 

	sum : ppsum 
	generic map (n) 
	port map (Gs,P,S); 


end ppa_sk_adder;

