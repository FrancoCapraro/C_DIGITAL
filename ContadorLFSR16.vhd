-- ------------------------------------------------------------------------ --
library ieee; 

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ContadorLFSR16 is

generic(Valor_Inicial: std_logic_vector(15 downto 0):= "0001001000000000");

	port( 
		CLOCK: in std_logic;

		rst: in std_logic;

		Salidas: out std_logic_vector(15 downto 0)
	);
end ContadorLFSR16;

architecture archh of ContadorLFSR16 is

	signal Salida_int_i: std_logic_vector(15 downto 0);
	signal bit_xor : std_logic;
	
	begin

	M1: process(rst, CLOCK)
		begin
		bit_xor <= (Salida_int_i(15) xor Salida_int_i(14));
		if(rst= '1' ) then

			Salida_int_i <= Valor_Inicial;
 
		elsif (rising_edge(CLOCK)) then 
			
			
			Salida_int_i <= Salida_int_i(14) & Salida_int_i(13) & Salida_int_i(12) & Salida_int_i(11) & Salida_int_i(10) & Salida_int_i(9) & Salida_int_i(8) & Salida_int_i(7) 
			& Salida_int_i(6) & Salida_int_i(5) & Salida_int_i(4) & Salida_int_i(3) & Salida_int_i(2) & Salida_int_i(1) & 
			Salida_int_i(0) & bit_xor;
	
		end if; 
	end process M1; 

	Salidas <= Salida_int_i; 

end architecture archh; 

