-- Description :
--	Test bench for input operands with 16 bits

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY csa16b_testbench IS
  END csa16b_testbench;

  ARCHITECTURE behavior OF csa16b_testbench IS 

  -- Component Declaration
   COMPONENT csa
	generic (wordLength: INTEGER; logWordLength: INTEGER);
			port(A,B : in Std_Logic_Vector; 
			CI : in Std_Logic; 
			OP: in STD_LOGIC;
			S : out Std_Logic_Vector;
			COUT : out Std_Logic;
			Overflow: out STD_LOGIC);
	END COMPONENT;
   
	--Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL A :  std_logic_vector(15 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(15 downto 0) := (others=>'0');
	SIGNAL OP: STD_LOGIC := '1';
	--Outputs
	SIGNAL S :  std_logic_vector(15 downto 0);
	SIGNAL COUT :  std_logic;
	SIGNAL 	Overflow:  std_logic;

          

  BEGIN

  -- Component Instantiation
          uut: csa generic map (16,4) PORT MAP(
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

      wait for 100 ns; -- wait until global set/reset completesB<="1001101100111101" after 10ns; -- 39741
		
		A<="1101110010011110" after 40ns; -- 56478
		B<="1101111000000111" after 70ns; -- 56839
		A<="1001000001011010" after 100ns; -- 36954
		B<="0110110111110101" after 130ns; -- 28149
		A<="1010101010000000" after 160ns; -- 43648
		B<="0101111011101000" after 190ns; -- 24296
		A<="1000100100001000" after 220ns; -- 35080
		B<="0010110011101100" after 250ns; -- 11500
		A<="1101101101000100" after 280ns; -- 56132       
		
		wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
