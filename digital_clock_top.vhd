library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;

entity digital_clock_top is
generic(Valor_Contador: INTEGER:= 50000000/2);
port (
	clk50mhz: 	in STD_LOGIC;
	clk:		out STD_LOGIC
);
end digital_clock_top;

architecture rtl of digital_clock_top is
	--MAX COUNT DEBO HACERLO GENERICO PARA PODER HACER LAS DISTINTAS FREQ
	constant max_count: INTEGER:= Valor_Contador;
	--LE ASIGNO EL VALOR 'GENERICO' A MAX COUNT 
	signal count: INTEGER range 0 to max_count;
	signal clk_state: STD_LOGIC := '0';
	
	
begin
	gen_clock: process(clk50mhz, clk_state, count)
	begin
		if clk50mhz'event and clk50mhz='1' then
			if count < max_count then 
				count <= count+1;
			else
				clk_state <= not clk_state;
				count <= 0;
			end if;
		end if;
	end process;
	
	persecond: process (clk_state)
	begin
		clk <= clk_state;
	end process;
	
end rtl;

--Frecuencia Deseada		Contador
--0.1 Hz						500.000.000
--0.5 Hz						100.000.000
--1 	Hz						50.000.000
--2 	Hz						25.000.000
--5 	Hz						10.000.000
