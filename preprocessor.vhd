----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:00 10/09/2007 
-- Design Name: 
-- Module Name:    preprocessor - Behavioral 
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

-- komponenta koja racuna sume i prenose za svaku bitsku poziciju
entity preprocessor is
	generic (wordLength: INTEGER :=32);
	port(A,B : in Std_Logic_Vector (wordLength-1 downto 0); 
	ZeroSum, OneSum, ZeroCarry, OneCarry: out Std_Logic_Vector(wordLength-1 downto 0));
end preprocessor;

architecture Behavioral of preprocessor is

begin

	ZeroSum <= A xor B; 
	OneSum<= not (A xor B);
	ZeroCarry <= A AND B;
	OneCarry <= A OR B;

end Behavioral;

