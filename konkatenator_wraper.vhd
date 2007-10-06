----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:51 10/06/2007 
-- Design Name: 
-- Module Name:    konkatenator_wraper - Behavioral 
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

entity konkatenator_wraper is
Port ( A : in  STD_LOGIC_VECTOR(7 downto 0); --unconstrained
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           c : out  STD_LOGIC_VECTOR(7 downto 0));
end konkatenator_wraper;

architecture Behavioral of konkatenator_wraper is
COMPONENT konkatenator
	PORT(
		A : IN std_logic_vector;
		B : IN std_logic_vector;
		c : OUT std_logic_vector
		);
	END COMPONENT;
begin
--l2: for j in 1 to 4 generate
--prvi_red: konkatenator 
--	port map( A(2*j-1 downto 2*j-1-(2**(0)-1)),
--					B(2*j-1 - (2**(0)-1)-1 downto 2*j-1-(2**(0)-1)-1 -(2**(0)-1)),
--					c(2*j-1 downto 2*j-2));
--	end generate l2;
l2: for j in 1 to 2 generate
prvi_red: konkatenator 
	port map( A(2*2*j-1 downto 2*2*j-1-(2**(1)-1)),
					B(2*2*j-1 - (2**(1)-1)-1 downto 2*2*j-1-(2**(1)-1)-1 -(2**(1)-1)),
					c(4*j-1 downto 4*(j-1)));
	end generate l2;


end Behavioral;

