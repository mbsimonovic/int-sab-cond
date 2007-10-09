-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY csa8b_testbench IS
  END csa8b_testbench;

  ARCHITECTURE behavior OF csa8b_testbench IS 

  -- Component Declaration
    COMPONENT  csa8b is
				port(A,B : in Std_Logic_Vector(8-1 downto 0); 
					CI : in Std_Logic; 
					OP: in STD_LOGIC;
					S : out Std_Logic_Vector(8-1 downto 0);
					COUT : out Std_Logic;
					Overflow: out STD_LOGIC);
			END COMPONENT;

         --Inputs
	SIGNAL CI :  std_logic := '0';
	SIGNAL A :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL OP: STD_LOGIC := '0';
	--Outputs
	SIGNAL S :  std_logic_vector(7 downto 0);
	SIGNAL COUT :  std_logic;
	SIGNAL 	Overflow:  std_logic;

  BEGIN

  -- Component Instantiation
          uut: csa8b PORT MAP(
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

       
		A<="00110110" after 10ns;
		B<="01101101" after 20ns;
	   A<="11101110" after 30ns;
		B<="01101101" after 40ns;
		B<="00000101" after 40ns;
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
