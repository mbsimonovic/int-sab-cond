
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppa_sk is
	generic (n: integer; m: integer);
	port( 
		G0, P0: in STD_LOGIC_VECTOR (n-1 downto 0);
		Gm: out STD_LOGIC_VECTOR (n-1 downto 0));
end ppa_sk;

architecture ppa_sk of ppa_sk is
signal G,P: STD_LOGIC_VECTOR (0 to (m+1)*n -1);
begin
	input: for i in 0 to n -1 generate
		P(i) <= P0(i); 
		G(i) <= G0(i); 
	end generate input; 
	stage: for st in 1 to m generate
	group1: for gr in 0 to 2**(m-st)-1 generate 
			white_cells: 
				for w in 0 to 2**(st-1)-1  generate 
					white_cell: if gr*2**st + w < n generate 
						G(st*n + gr*2**st +w) <= G((st-1)*n + gr*2**st + w);
						P(st*n + gr*2**st +w) <= P((st-1)*n + gr*2**st + w);
					end generate white_cell; 
			end generate white_cells; 

			colored_cells: 
				for c in 2**(st-1)-1 to 2**st-1 generate 
					colored_cell: if gr*2**st + c < n generate 
						grey_or_black_cell: 
						   G(st*n + gr*2**st +c) <= G((st-1)*n + gr*2**st + c)
							or 
							(P((st-1)*n + gr*2**st + c) 
							  and 
							 G((st-1)*n + gr*2**st + 2**(st-1)-1));
							
								grey_cell: if gr = 0 generate
									P(st*n + c) <= P((st-1)*n +c);
								end generate grey_cell; 
								
								black_cell: if gr > 0 generate 
									P(st*n + gr*2**st +c) <= P((st-1)*n + gr*2**st + c)
								and 
									P((st-1)*n + gr*2**st + 2**(st-1) -1);
								end generate black_cell; 
					end generate colored_cell; 
			end generate colored_cells; 
		end generate group1; 
end generate stage; 

output: for o in 0 to n-1 generate
	Gm(o) <=G(n*m+o);
end generate output;
	
end ppa_sk;

