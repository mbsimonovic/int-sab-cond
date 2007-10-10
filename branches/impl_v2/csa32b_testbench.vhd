-- Description :
--	Test bench for input operands with 32 bits
  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY csa32b_testbench IS
  END csa32b_testbench;

  ARCHITECTURE behavior OF csa32b_testbench IS 

  -- Component Declaration
          COMPONENT  csa32b is
				port(A,B : in Std_Logic_Vector(32-1 downto 0); 
					CI : in Std_Logic; 
					OP: in STD_LOGIC;
					S : out Std_Logic_Vector(32-1 downto 0);
					COUT : out Std_Logic;
					Overflow: out STD_LOGIC);
			END COMPONENT;

         --Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL A :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL OP: STD_LOGIC := '0';
	--Outputs
	SIGNAL S :  std_logic_vector(31 downto 0);
	SIGNAL COUT :  std_logic;
	SIGNAL 	Overflow:  std_logic;

  BEGIN

  -- Component Instantiation
          uut: csa32b PORT MAP(
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

		B<="00010111111000101010000001110001" after 10ns; -- 400728177
		B<="00001010110111110110101001101000" after 20ns; -- 182413928
		A<="00000100100001111010001010000011" after 30ns; -- 75997827
		A<="00010010111100110101000111010100" after 40ns; -- 317936084
		A<="00001000011100010111000111011000" after 50ns; -- 141652440
		B<="01100111001010111010001001010101" after 60ns; -- 1730912853
		A<="00101110011111000010101001011101" after 70ns; -- 779889245
		A<="01100110010001001100101000010011" after 80ns; -- 1715784211
		B<="00110111001100100100100001000110" after 90ns; -- 926042182
		A<="00100011010111111001010110101001" after 100ns; -- 593466793
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
