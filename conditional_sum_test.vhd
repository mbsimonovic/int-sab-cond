
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:03:09 10/02/2007
-- Design Name:   conditional_sum_adder
-- Module Name:   c:/apps/Xilinx/int_sab_cond/conditional_sum_test.vhd
-- Project Name:  int_sab_cond
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: conditional_sum_adder
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

ENTITY conditional_sum_test_vhd IS
END conditional_sum_test_vhd;

ARCHITECTURE behavior OF conditional_sum_test_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT conditional_sum_adder
	port(A,B : in Std_Logic_Vector(7 downto 0); 
	CI : in Std_Logic; 
	SUB : in Std_Logic; 
	S : out Std_Logic_Vector(7 downto 0); 
	CO : out Std_Logic);
	END COMPONENT;

	--Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL SUB :  std_logic := '0';
	SIGNAL A :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL S :  std_logic_vector(7 downto 0);
	SIGNAL CO :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: conditional_sum_adder PORT MAP(
		A => A,
		B => B,
		CI => CI,
		SUB => SUB,
		S => S,
		CO => CO
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		--wait for 100 ns;
		-- Place stimulus here
			A<= "00000000" ;
			B<= "00000000" ;
			A<= "00000001" after 10ns;
			A<= "00000011" after 20ns;
			B<= "00000001" after 30ns;
			B<= "00000010" after 40ns;
			B<= "00000001" after 50ns;
			B<= "00001011" after 60ns;
			--A<= "00000000" after 90ns;
			--B<= "00000000" after 90ns;
		wait; -- will wait forever
	END PROCESS;

END;
