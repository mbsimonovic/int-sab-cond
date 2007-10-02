----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:00 10/02/2007 
-- Design Name: 
-- Module Name:    ppshl - Behavioral 
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


entity ppshl is 
	generic (n : integer); 
	port (GI : in STD_LOGIC_VECTOR (n-1 downto 0);
	CI : in Std_Logic; 
	GO : out STD_LOGIC_VECTOR (n-1 downto 0);
	COUT : out Std_Logic); 
end ppshl;

architecture ppshl of ppshl is

begin
msb: COUT<=GI(n-1);
shl: for s in n-1 downto 1 generate
	GO(s) <= GI(s-1);
	end generate;
	lsg: GO(0) <= CI;

end ppshl;



