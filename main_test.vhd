
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:37:46 10/04/2007
-- Design Name:   main
-- Module Name:   D:/fax/03_algarh/04_projekat-conditional-sum_adder/impl_v2/main_test.vhd
-- Project Name:  cond_sum_adder_v2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY main_test_vhd IS
END main_test_vhd;

ARCHITECTURE behavior OF main_test_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT main
	port(A,B : in Std_Logic_Vector(7 downto 0); 
		CI : in Std_Logic; 
		S : out Std_Logic_Vector(7 downto 0); 
		COUT : out Std_Logic); 
	END COMPONENT;

	--Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL A :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL S :  std_logic_vector(7 downto 0);
	SIGNAL COUT :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: main PORT MAP(
		A => A,
		B => B,
		CI => CI,
		S => S,
		COUT => COUT
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		A<="00110110" ;
		B<="01101101" ;
--	   A<="11101110" after 30ns;
--		B<="01101101" after 40ns;
--		B<="00000101" after 40ns;
		wait; -- will wait forever
	END PROCESS;

END;
