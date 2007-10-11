----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:06 10/09/2007 
-- Design Name: 
-- Module Name:    postprocessor - Behavioral 
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

entity postprocessor is
generic (wordLength: INTEGER :=32);
port(
	ZeroSum,OneSum : in Std_Logic_Vector(wordLength-1 downto 0); 
	CI,OP, ZeroCarry, OneCarry, PrevZeroCarry, PrevOneCarry  : in Std_Logic; 
	S : out Std_Logic_Vector(wordLength-1 downto 0);
	COUT, Overflow : out Std_Logic);
end postprocessor;

architecture Behavioral of postprocessor is
begin
--za operaciju oduzimanja, CI mora da bude 1, tj. uvek se selektuje S1
	S<=ZeroSum when CI ='0' and OP ='0' else OneSum;
	COUT<= ZeroCarry when CI ='0' else OneCarry;
	Overflow <= ZeroCarry xor PrevZeroCarry when CI ='0' else OneCarry xor PrevOneCarry;


end Behavioral;

