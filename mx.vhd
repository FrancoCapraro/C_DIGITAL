--Multiplexer Generico

library ieee;

use ieee.std_logic_1164.all;

entity mx is

	--generic(sel_ancho: integer:= 2);
	
		port(
		--ENTRADA : in std_logic_vector(((sel_ancho-1)*(sel_ancho-1)) downto 0);
		
		ENTRADA : in std_logic_vector(3 downto 0);
		SALIDA : out std_logic;
		
		--SEL : in std_logic_vector((sel_ancho-1) downto 0):
		SEL : in std_logic_vector(1 downto 0)
		);
end mx; 
architecture BEHAVE of mx is
	--signal tmp: std_logic_vector(((sel_ancho-1)*(sel_ancho-1)) downto 0);
	signal tmp: std_logic_vector(1 downto 0);

begin
	tmp<= SEL(1) & SEL(0);
	with tmp select
		SALIDA	 <=
			ENTRADA(0) when	"00",
			ENTRADA(1) when	"01",
			ENTRADA(2) when	"10",
			ENTRADA(3) when	"11",
			'-'		  when others;
			
end BEHAVE;