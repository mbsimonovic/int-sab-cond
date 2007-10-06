library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is

    Port ( A : in  STD_LOGIC_VECTOR ; -- Unconstrained array
           B : in  STD_LOGIC_VECTOR ;
           CTRL : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR );
end mux2x1;

architecture Behavioral of mux2x1 is

begin
process (a,b,ctrl)
begin
	if (CTRL = '1') then
		OUTPUT <= A;
	else 
		OUTPUT <= B;
	end if;
end process;
end Behavioral;

