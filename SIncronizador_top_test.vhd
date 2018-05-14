library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sincronizador_top_test is
  
end ;

architecture beh of Sincronizador_top_test is


signal CLOCK: std_logic:= '0';
signal btn_in	:  std_logic;
signal btn_out	:  std_logic;
signal reset	:  std_logic;

	component Sincronizador_top is
		port (
			clk	: in std_logic;
			reset	: in std_logic;
			Senal_in	: in std_logic;
			Senal_out	: out std_logic);
	end component;
	

	
	begin	
CLOCK <= not CLOCK after 20 ns;

btn_in <= '0', '1' after 10 ns, '0' after 30 ns,'1' after 60 ns, '0' after 100 ns,'1' after 130 ns, '0' after 200 ns ;
reset <= '1', '0' after 200 ns ;

M1:Sincronizador_top port map (CLOCK,reset,btn_in,btn_out);

end beh;
