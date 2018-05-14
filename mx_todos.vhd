library ieee;

use ieee.std_logic_1164.all;
ENTITY mx_todos IS
port(
		
		c0,c1,c2,c3 : in std_logic_vector(3 downto 0);
		s	: out std_logic_vector(3 downto 0);
		
		SEL : in std_logic_vector(1 downto 0)
		);
END mx_todos ;

ARCHITECTURE ch OF mx_todos IS


	signal tmp: std_logic_vector(3 downto 0);



component mx is
			port(
		
		ENTRADA : in std_logic_vector(3 downto 0);
		SALIDA : out std_logic;
		SEL : in std_logic_vector(1 downto 0)
		);
	end component; 
	signal mx0_inputs :	std_logic_vector(3 downto 0);
	signal mx1_inputs :	std_logic_vector(3 downto 0);
	signal mx2_inputs :	std_logic_vector(3 downto 0);
	signal mx3_inputs :	std_logic_vector(3 downto 0);
	
	begin
	
	--Sal1	<= (Salida0(0),Salida1(0),Salida2(0),Salida3(0));
	mx0_inputs <= (c0(0),c1(0),c2(0),c3(0));
	mx1_inputs <= (c0(1),c1(1),c2(1),c3(1));
	mx2_inputs <= (c0(2),c1(2),c2(2),c3(2));
	mx3_inputs <= (c0(3),c1(3),c2(3),c3(3));
	
	--for i in 3 generate
	--M0: Mux_Fr port map ((c0(i),c1(i),c2(i),c3(i)), s(i), SEL); -- DECLARO MI COMPONENTE 
	--end generate
	M0: mx port map (mx0_inputs, s(0), SEL); -- DECLARO MI COMPONENTE 
	M1: mx port map (mx1_inputs, s(1), SEL); -- DECLARO MI COMPONENTE 
	M2: mx port map (mx2_inputs, s(2), SEL); -- DECLARO MI COMPONENTE
	M3: mx port map (mx3_inputs, s(3), SEL); -- DECLARO MI COMPONENTE 	

			
end ch;