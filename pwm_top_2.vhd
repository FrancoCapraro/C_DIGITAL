library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
  
entity pwm_top is
    PORT(
        clk    : IN  STD_LOGIC;
        reset  : IN  STD_LOGIC;
        entrada: IN  STD_LOGIC_VECTOR(7 downto 0);
		  aload	: IN  STD_LOGIC; --SENAL EN CARGADA DE HABILITAR LA CARGA DE ENTRADA'
        salida : OUT STD_LOGIC
    );
end pwm_top;
  
architecture Beh of pwm_top is
    signal cnt : UNSIGNED(7 downto 0);
begin
    contador: process (clk, reset, entrada,aload) begin
        if reset = '1' then
		  
            cnt <= (others => '0');
				elsif (aload= '1') then
				cnt <= UNSIGNED(entrada);
				
				
        elsif rising_edge(clk) then
		  
            if cnt = 99 then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    -- Asignación de señales --
    salida <= '1' when (cnt < UNSIGNED(entrada)) else '0';
end Beh;