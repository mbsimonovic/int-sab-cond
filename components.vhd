--	
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package components is


  
component mux2x1 is
    Port ( A : in  STD_LOGIC_VECTOR ;--unconstrained
           B : in  STD_LOGIC_VECTOR ;
           CTRL : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR );
end component;
 
component preprocessor is
	generic (wordLength: INTEGER :=32);
	port(A,B : in Std_Logic_Vector (wordLength-1 downto 0); 
		ZeroSum, OneSum, ZeroCarry, OneCarry: out Std_Logic_Vector(wordLength-1 downto 0));
end component;

component postprocessor is
generic (wordLength: INTEGER :=32);
port(
	ZeroSum,OneSum : in Std_Logic_Vector(wordLength-1 downto 0); 
	CI,OP, ZeroCarry, OneCarry, PrevZeroCarry, PrevOneCarry  : in Std_Logic; 
	S : out Std_Logic_Vector(wordLength-1 downto 0);
	COUT, Overflow : out Std_Logic);
end component;

component parallel_carry_sum_generator is
generic (wordLength: INTEGER; logWordLength: INTEGER);
port(
	ZeroSum,OneSum : in Std_Logic_Vector(wordLength-1 downto 0); --inicijalne sume
	ZeroCarry,OneCarry: in Std_Logic_Vector(wordLength-1 downto 0);--inicijalni prenosi
	ZeroSumFinal,OneSumFinal : out Std_Logic_Vector(wordLength-1 downto 0); --rezultat
	ZeroCarryFinal,OneCarryFinal : out Std_Logic_Vector(wordLength-1 downto 0)); --prenos
end component;
-- Declare constants

--  constant <constant_name>		: time := <time_unit> ns;
--  constant <constant_name>		: integer := <value>;
-- 
-- Declare functions and procedure

--  function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
--  procedure <procedure_name>	(<type_declaration> <constant_name>	: in <type_declaration>);

end components;


--package body <Package_Name> is
--
---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;
--
--
---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;
--
---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
-- 
--end <Package_Name>;