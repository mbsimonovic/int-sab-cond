-- Description :
--	Test bench for input operands with 16 bits

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY csa16b_testbench IS
  END csa16b_testbench;

  ARCHITECTURE behavior OF csa16b_testbench IS 

  -- Component Declaration
   COMPONENT csa16b
			port(A,B : in Std_Logic_Vector(16-1 downto 0); 
			CI : in Std_Logic; 
			OP: in STD_LOGIC;
			S : out Std_Logic_Vector(16-1 downto 0);
			COUT : out Std_Logic;
			Overflow: out STD_LOGIC);
	END COMPONENT;
   
	--Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL A :  std_logic_vector(15 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(15 downto 0) := (others=>'0');
	SIGNAL OP: STD_LOGIC := '0';
	--Outputs
	SIGNAL S :  std_logic_vector(15 downto 0);
	SIGNAL COUT :  std_logic;
	SIGNAL 	Overflow:  std_logic;

          

  BEGIN

  -- Component Instantiation
          uut: csa16b PORT MAP(
               A => A,
					B => B,
					CI => CI,
					OP => OP,
					S => S,
					COUT => COUT,
					Overflow => Overflow
			);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here
		A<="0011011000000101" after 10ns;
		B<="0110110100000101" after 20ns;
	   A<="0110111000000101" after 30ns;
		B<="0110110100000101" after 40ns;
		B<="0000010100000101" after 40ns;
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
