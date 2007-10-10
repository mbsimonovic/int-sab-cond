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


   tb : PROCESS
     BEGIN

      wait for 100 ns; -- wait until global set/reset completes
		
		A<="10010101" after 40ns; -- 149
		B<="01001101" after 70ns; -- 77
		A<="11011111" after 100ns; -- 223
		B<="00001101" after 130ns; -- 13
		A<="10100001" after 160ns; -- 161
		OP<='1'; --prelazimo na oduzimanje
		B<="11011101" after 190ns; -- 221
		A<="11110101" after 220ns; -- 245
		B<="00110101" after 250ns; -- 53
		A<="10101010" after 280ns; -- 170
--       A<="10101011" after 10ns; 
--		B<="01111101" after 20ns; 
--		A<="11001111" after 30ns; 
--		B<="00100110" after 40ns; 
--		A<="10011001" after 50ns; 
--		B<="10100100" after 60ns; 
--		A<="00110000" after 70ns; 
--		B<="10100000" after 80ns;
--		A<="11011001" after 90ns; 
--		B<="11001001" after 100ns;
--		A<="00110110" after 110ns;
--		B<="01101101" after 120ns;
--	   A<="11101110" after 130ns;
--		B<="01101101" after 140ns;
--		B<="00000101" after 140ns;
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;