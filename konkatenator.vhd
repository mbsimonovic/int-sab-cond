----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:26 10/06/2007 
-- Design Name: 
-- Module Name:    konkatenator - Behavioral 
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

entity konkatenator is
	--generic (n: integer);
    Port ( A : in  STD_LOGIC_VECTOR ; --unconstrained
           B : in  STD_LOGIC_VECTOR;
           c : out  STD_LOGIC_VECTOR);
end konkatenator;
architecture Behavioral of konkatenator is
begin
	C<=A&B;
end Behavioral;

