library ieee;

use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Contador IS
port(
		
		c0,c1,c2,c3 : out  std_logic_vector(3 downto 0);
		s	: out std_logic_vector(6 downto 0);
		aload  : IN  STD_LOGIC;
		SEL : in std_logic_vector(1 downto 0);
		CLOCK: in std_logic;
		rst: in std_logic;
		Muestra: out std_logic_vector(3 downto 0)
			
		);
		
END Contador ;

ARCHITECTURE bhd OF Contador IS


	signal r1						: std_logic_vector(3 downto 0);


	--signal CLOCK: std_logic:= '0';
	--signal rst: std_logic;
	signal Salida0,Salida1,Salida2,Salida3: std_logic_vector(3 downto 0);
	signal Salida01,Salida11,Salida21,Salida31: std_logic_vector(3 downto 0);


	
	signal a, b, c, d					: STD_LOGIC ;
	signal SALIDAmx			 		:  std_logic_vector(3 downto 0);

	signal s0,s1,s2,s3,s4,s5	:  STD_LOGIC;
	signal s6	:  STD_LOGIC;

	signal r2: std_logic_vector(6 downto 0);
	signal Sal1, Sal2,Sal3,Sal4 :std_logic_vector(3 downto 0);
	
	signal data1,data2,data3,data4: std_LOGIC_VECTOR(3 downto 0);
	signal CLOCK_1HZ : STD_LOGIC ;
	------ DECLARACION DE COMPONENTES-----------------
	
component digital_clock_top is
generic(Valor_Contador: INTEGER:= 50000000);
	port (
		clk50mhz: 	in STD_LOGIC;
		clk:		out STD_LOGIC
	);
end component;


	
component mx_todos is
			
	PORT (c0,c1,c2,c3 : in std_logic_vector(3 downto 0);
			s	: out std_logic_vector(3 downto 0);
			SEL: in std_logic_vector(1 downto 0));
			
	
end component;

	--PARTE MULTIPLEXER
	
	component mx is
					port(
					ENTRADA 						: in std_logic_vector(3 downto 0);
					SALIDA 						: out std_logic;
					SEL 							: in std_logic_vector(1 downto 0)
					);
		end component;

		
	--PARTE DECODIFICADOR

	component DECO is
					PORT ( 
					a, b, c, d: IN STD_LOGIC ;
					s0,s1,s2,s3,s4,s5,s6: OUT STD_LOGIC
					) ;
	end component; 
	
	
	--PARTE ContadorLFSR
	component ContadorUp is
		 PORT (
        clk    : IN  STD_LOGIC;
        areset : IN  STD_LOGIC;
        aload  : IN  STD_LOGIC;
        data   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        cnt_out: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
		end component;
	
	

	
begin


 RELOJ: digital_clock_top generic map (50000000/2)  port map (CLOCK, CLOCK_1HZ);

data1<= "0011";
data2<= "0111";
data3<= "0010";
data4<= "1011";


Componente_0: ContadorUp port map(CLOCK_1HZ,rst,aload,data1,Salida01);

Componente_1: ContadorUp port map(CLOCK_1HZ,rst,aload,data2,Salida11);

Componente_2: ContadorUp port map(CLOCK_1HZ,rst,aload,data3,Salida21);

Componente_3: ContadorUp port map(CLOCK_1HZ,rst,aload,data4,Salida31);


Salida0<=Salida01;
Salida1<=Salida11;
Salida2<=Salida21;
Salida3<=Salida31;

Sal1	<= Salida0;
Sal2	<=	Salida1;
Sal3 	<=	Salida2;
Sal4	<= Salida3;
 
c0	<= Salida0;
c1	<=	Salida1;
c2 <=	Salida2;
c3	<= Salida3;
--c0	<= (Salida0(0),Salida1(0),Salida2(0),Salida3(0));
--c1	<=	(Salida0(1),Salida1(1),Salida2(1),Salida3(1));
--c2	<=	(Salida0(2),Salida1(2),Salida2(2),Salida3(2));
--c3	<= (Salida0(3),Salida1(3),Salida2(3),Salida3(3));


---------------INSTANCIO 4 MULTIPLEXERS------------------------
--D4: mx_todos port map ((Salida0(0)&Salida1(0)&Salida2(0)&Salida3(0)), (Salida0(1)&Salida1(1)&Salida2(1)&Salida3(1)),(Salida0(2)&Salida1(2)&Salida2(2)&Salida3(2)),(Salida0(3)&Salida1(3)&Salida2(3)&Salida3(3)),SALIDAmx,SEL); -- DECLARO MI COMPONENTE 
D4: mx_todos port map (Sal1, Sal2,Sal3,Sal4,SALIDAmx,SEL); -- DECLARO MI COMPONENTE 


	
a	<= 	SALIDAmx(3);
b	<= 	SALIDAmx(2);
c	<= 	SALIDAmx(1);
d	<= 	SALIDAmx(0);


---------------INSTANCIO 1 DECODIFICADOR 7 SEGMENTOS------------------------
D1: DECO port map (a,b,c,d,s0,s1,s2,s3,s4,s5,s6); -- DECLARO MI COMPONENTE 

Muestra<= a & b & c & d;

s<= (s6 , s5 , s4 , s3 , s2 , s1 , s0 );


end archiTECTURE bhd;