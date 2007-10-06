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
    Port ( A : in  STD_LOGIC_VECTOR; --unconstrained
           B : in  STD_LOGIC_VECTOR;
           c : inout  STD_LOGIC_VECTOR);
end konkatenator;
architecture Behavioral of konkatenator is
begin
process (a,b,c) 
begin
C <= (C'range => '0');-- AND (NOT C); --prvo mora da se pocisti bafer
C<=A&B;
end process;

end Behavioral;

