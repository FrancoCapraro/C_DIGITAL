library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use ieee.numeric_std.all;

entity pwm_top is
    PORT (
        clk    : IN  STD_LOGIC;
        areset : IN  STD_LOGIC;
        aload  : IN  STD_LOGIC;
        data   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        pwm_out: OUT STD_LOGIC;
		  pwm_out_LED: OUT STD_LOGIC
    );
end pwm_top;
 
architecture Behavioral of pwm_top is
    -- Señal temporal para el contador. 
	 signal cnt_total: STD_LOGIC_VECTOR(7 DOWNTO 0):= "11111111";--SENAL DE CUENTA MAXIMA 256 ESTADOS
    signal cnt_tmp: STD_LOGIC_VECTOR(7 DOWNTO 0) := "10000000"; --SENAL DE CUENTA (DIFERENCIA)
	 signal pwm_out_temp :STD_LOGIC:='1';
--	 signal data_latch : STD_LOGIC_VECTOR(7 DOWNTO 0);
	 signal flag :STD_LOGIC:='0';
	 signal aload_deb :STD_LOGIC;
	 
	 
	 COMPONENT debouncer_top is
    port (
		clk		: in std_logic;
		reset		: in std_logic;
		btn_in	: in std_logic;
		btn_out	: out std_logic);
	end component;
	 
	 
begin



 M1: debouncer_top port map (clk,areset,aload,aload_deb);
	
	
    proceso_contador: process (aload_deb, areset, clk) begin
			
	 
        if areset = '1' then
            cnt_tmp <= "11111111";
				
        elsif aload_deb = '1' then
            cnt_tmp <= data;
				
				
        elsif rising_edge(clk)then
		  
				if ((flag = '0')) then
					cnt_tmp <= cnt_tmp - 1;
					pwm_out_temp<= '1';
				end if;
				
			
	    --Utilizo la bandera para evitar que siga decrementando cnt_tmp y se produzca overflow . cuando termine cnt_total vuelvo a limpiar la bandera			
		  
		  
				if(cnt_tmp="00000000" ) then
					pwm_out_temp<= '0';
					flag <= '1';
					
					
				end if;
				
				if((cnt_total)="00000000") then
					pwm_out_temp<= '1';
					cnt_tmp <= data;
					cnt_total<="11111111";
					flag <= '0';
					
				end if;
				
				
			cnt_total <= cnt_total - 1;			
        end if;
    end process;
	 	pwm_out <= pwm_out_temp;
		pwm_out_LED <= pwm_out_temp;

end Behavioral;