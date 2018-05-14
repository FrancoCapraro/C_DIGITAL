LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY DECO IS

	PORT ( 
		a, b, c, d: IN STD_LOGIC ;
		s0,s1,s2,s3,s4,s5,s6: OUT STD_LOGIC
			) ;
		
END DECO ;


ARCHITECTURE Prueba OF DECO IS

	signal r1: std_logic_vector(3 downto 0); -- Defino vector de Entradas
	signal r2: std_logic_vector(6 downto 0);
	
	-- generic signal S1: std_logic_vector(Width-1 downto 0); ?????
	
		BEGIN
			r1 <= (a , b , c , d) ; -- CONCATENO LAS 4 Entradas en un Vector
			
			
			-- for K in 0 to Width-1 generate    
			
			with r1 select
			
			r2 <= 
					"0000001" when "0000"  , 
					"1001111" when "0001"  ,
					"0010010" when "0010"  ,
					"0000110" when "0011"  ,
					"1001100" when "0100"  ,
					"0100100" when "0101"  ,
					"0100000" when "0110"  ,
					"0001110" when "0111"  ,
					"0000000" when "1000"  ,
					"0000100" when "1001"  ,
					"0001000" when "1010"  ,
					"1100000" when "1011"  ,
					"0110001" when "1100"  ,
					"1000010" when "1101"  ,
					"0110000" when "1110"  ,
					"0111000" when "1111"  ,
					"1111111" when others	;
			
			--S2 => s0 & s1 & s2 & s3 & s4 & s5 & s6 & s7 ;
			(s0 , s1 , s2 , s3 , s4 , s5 , s6 )  <= r2;
			
		END Prueba ;
		
	
		
