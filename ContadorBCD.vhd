----------------------------------------------------------------------------------
-- COPYRIGHT 2015 Jes�s Eduardo M�ndez Rosales
--This program is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--
-- Description: Este c�digo es la implementaci�n de un contador de 0 a 9 
-- utilizando un display de 7 segmentos de c�todo com�n, dicho contador se 
-- incrementa cada segundo.
--
-- Caracter�sticas:
-- Para iniciar el conteo poner a INI a '1'
-- Para detener el conteo poner a INI a '0'
-- Para reiniciar el conteo poner a RESET a '1'
--
-- NOTA: Se puede cambiar el tiempo del conteo modificando la constante RETRASO_FIN
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ContadorBCD is

		PORT( 
		  clk    : IN  STD_LOGIC;
        areset : IN  STD_LOGIC;
        aload  : IN  STD_LOGIC;
        data   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        cnt_out: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);

end ContadorBCD;

architecture Beh of ContadorBCD is


--SIGNAL CONTADOR_PRINCIPAL : INTEGER RANGE 0 TO 9 := 0;
signal cnt_tmp: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

begin


process(aload, areset, clk, data)
BEGIN
	if (areset = '1') then
		cnt_tmp <= "0000";
	elsif aload = '1' then
            cnt_tmp <= data;

	elsif RISING_EDGE(CLK) then
			cnt_tmp <= cnt_tmp +1;
					iF cnt_tmp = "1001" then
							cnt_tmp <= "0000";
					END IF;
	END IF;
		
END PROCESS;
cnt_out <= cnt_tmp;			

end Beh;