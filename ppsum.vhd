----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:16 10/02/2007 
-- Design Name: 
-- Module Name:    ppsum - Behavioral 
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

entity ppsum is 
	generic (n : integer); 
	port (G, P : in STD_LOGIC_VECTOR (n-1 downto 0);
		S : out STD_LOGIC_VECTOR (n-1 downto 0));
end ppsum;

architecture ppsum of ppsum is
begin
	sum : for su in n-1 downto 0 generate
	S(su) <= G(su) xor P(su);
	end generate sum;
end ppsum;