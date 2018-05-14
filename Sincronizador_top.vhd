library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sincronizador_top is
    port (
			clk	: in std_logic;
			reset	: in std_logic;
			Senal_in	: in std_logic;
			Senal_out	: out std_logic);
end Sincronizador_top;

architecture beh of Sincronizador_top is
    


begin
    process(clk,reset)
    begin
	 
	if (reset='0') then
			Senal_out <= '0';
			elsif (clk'event and clk='1') then
			
			Senal_out <= Senal_in;
	end if;
    end process;
end beh;