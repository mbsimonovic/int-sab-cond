
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
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		CI : IN std_logic;
		SUB : IN std_logic;          
		S : OUT std_logic_vector(7 downto 0);
		N : OUT std_logic;
		Z : OUT std_logic;
		V : OUT std_logic;
		LT : OUT std_logic;
		CO : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL SUB :  std_logic := '0';
	SIGNAL A :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL S :  std_logic_vector(7 downto 0);
	SIGNAL N :  std_logic;
	SIGNAL Z :  std_logic;
	SIGNAL V :  std_logic;
	SIGNAL LT :  std_logic;
	SIGNAL CO :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: conditional_sum_adder PORT MAP(
		A => A,
		B => B,
		CI => CI,
		SUB => SUB,
		S => S,
		N => N,
		Z => Z,
		V => V,
		LT => LT,
		CO => CO
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		-- Place stimulus here
			A<= "00000000" after 100ns;
			B<= "00000000" after 100ns;
			A<= "00000001" after 120ns;
			A<= "00000011" after 140ns;
			B<= "00000001" after 160ns;
		wait; -- will wait forever
	END PROCESS;

END;
