-- ------------------------------------------------------------------------ --
library ieee; 

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ContadorLFSR32 is

generic(Valor_Inicial: std_logic_vector(31 downto 0):= "00010010000000000001001000000000");

	port( 
		CLOCK: in std_logic;

		rst: in std_logic;

		Salidas: out std_logic_vector(31 downto 0)
	);
end ContadorLFSR32;

architecture archh of ContadorLFSR32 is

	signal Salida_int_i: std_logic_vector(31 downto 0);
	signal bit_xor : std_logic;
	
	begin

	M1: process(rst, CLOCK)
		begin
		bit_xor <= (Salida_int_i(31) xor Salida_int_i(30));
		if(rst= '1' ) then

			Salida_int_i <= Valor_Inicial;
 
		elsif (rising_edge(CLOCK)) then 
			
			
			Salida_int_i <= 
			Salida_int_i(30) & Salida_int_i(29) & Salida_int_i(28) & 
			Salida_int_i(27) & Salida_int_i(26) & Salida_int_i(25) & 
			Salida_int_i(24) & Salida_int_i(23) & Salida_int_i(22) & 
			Salida_int_i(21) & Salida_int_i(20) & Salida_int_i(19) & 
			Salida_int_i(18) & Salida_int_i(17) & Salida_int_i(16) & 
			Salida_int_i(15) & Salida_int_i(14) & Salida_int_i(13) & 
			Salida_int_i(12) & Salida_int_i(11) & Salida_int_i(10) & 
			Salida_int_i(9) & Salida_int_i(8) & Salida_int_i(7) & 
			Salida_int_i(6) & Salida_int_i(5) & Salida_int_i(4) & 
			Salida_int_i(3) & Salida_int_i(2) & Salida_int_i(1) & 
			Salida_int_i(0) & bit_xor;
	
		end if; 
	end process M1; 

	Salidas <= Salida_int_i; 

end architecture archh; 

