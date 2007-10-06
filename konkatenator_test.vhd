
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:53:18 10/06/2007
-- Design Name:   konkatenator
-- Module Name:   D:/fax/03_algarh/04_projekat-conditional-sum_adder/google_int_sab_v2/konkatenator_test.vhd
-- Project Name:  cond_sum_adder_v2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: konkatenator
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

ENTITY konkatenator_test_vhd IS
END konkatenator_test_vhd;

ARCHITECTURE behavior OF konkatenator_test_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT konkatenator
	PORT(
		A : IN std_logic_vector;
		B : IN std_logic_vector;       
		c : INOUT std_logic_vector
		);
	END COMPONENT;

	--Inputs
	SIGNAL A :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(7 downto 0) := (others=>'0');

	--BiDirs
	SIGNAL A :  std_logic_vector(7 downto 0);
	SIGNAL B :  std_logic_vector(7 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: konkatenator PORT MAP(
		A => A,
		B => B,
		c => c
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		A<="00000001" after 10ns;
	   A<="00000011" after 20ns;
		B<="00000010" after 30ns;
		B<="00000101" after 40ns;

		wait; -- will wait forever
	END PROCESS;

END;
