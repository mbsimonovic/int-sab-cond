library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Multiplekser tipa 2 u 1 sa proizvoljnom duzinom ulaznih signala. 
-- Za CTRL='1' na izlazu se pojavljuje signal A, za CTRL='0' signal B.
entity mux2x1 is
    Port ( A : in  STD_LOGIC_VECTOR ; 			-- prvi ulazni signal
           B : in  STD_LOGIC_VECTOR ;			-- drugi ulazni signal
           CTRL : in  STD_LOGIC;					-- kontrolni signal
           OUTPUT : out  STD_LOGIC_VECTOR ); -- izlazni signal
end mux2x1;

architecture Behavioral of mux2x1 is

begin
	OUTPUT <= A WHEN CTRL ='1' else B;
--alternativno:
--	process (a,b,ctrl)
--	begin
--		if (CTRL = '1') then
--			OUTPUT <= A;
--		else 
--			OUTPUT <= B;
--		end if;
--	end process;
end Behavioral;

