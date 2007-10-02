----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:24:38 10/02/2007 
-- Design Name: 
-- Module Name:    ppgpgen - Behavioral 
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

entity ppgpgen is
	generic (n : integer);
	port (A,B: in STD_LOGIC_VECTOR (n-1 downto 0);
	CI : in Std_Logic;
	G,P: out STD_LOGIC_VECTOR (n-1 downto 0));
end ppgpgen;

architecture ppgpgen of ppgpgen is

begin
	square_cell0 : 
	G(0) <= (CI and A(0)) or (CI and B(0)) or 
	(A(0) and B(0)); 
	P(0) <= A(0) xor B(0); 

	square_cells : for sc in 1 to n-1 generate
		G(sc) <= A(sc) and B(sc);
		P(sc) <= A(sc) xor B(sc);
	end generate square_cells; 

end ppgpgen;

