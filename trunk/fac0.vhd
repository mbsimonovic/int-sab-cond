----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:19:52 10/02/2007 
-- Design Name: 
-- Module Name:    fac0 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fac0 is
	generic (n : integer); 
	port (A,B,P : in STD_LOGIC_VECTOR (n-1 downto 0); 
	CI : in Std_Logic; 
	E : out Std_Logic); 
end fac0;

architecture fac0 of fac0 is

	function ReduceAnd (INPUT: STD_LOGIC_VECTOR) return Std_Logic is 
	variable RESULT : Std_Logic; 
	begin 
		RESULT := '1'; 
		for J in INPUT'range loop 
		RESULT := INPUT(J) and RESULT; 
		exit when RESULT = '0'; 
		end loop; 
		return RESULT; 
	end; 
	signal V,Z : STD_LOGIC_VECTOR (n-1 downto 0); 

begin 
	required_carry: for r in 0 to n-2 generate 
	V(r) <= A(r) or B(r); 
	end generate required_carry; 
	zero0: Z(0) <= not (P(0) xor CI); 
	zero: for ze in 1 to n-1 generate 
	Z(ze) <= not (V(ze-1) xor P(ze)); 
	end generate zero; 
	E <= ReduceAnd(Z); 

end fac0;

