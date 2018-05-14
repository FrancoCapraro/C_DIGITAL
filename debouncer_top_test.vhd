library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debouncer_top_test is
  
end ;

architecture beh of debouncer_top_test is


signal CLOCK: std_logic:= '0';
signal btn_in	:  std_logic;
signal btn_out	:  std_logic;
signal reset 	:	std_logic;

	component debouncer_top is
		port (
			clk	: in std_logic;
			reset 	: in	std_logic;
			btn_in	: in std_logic;
			btn_out	: out std_logic);
	end component;
	

	
	begin	
CLOCK <= not CLOCK after 20 ns;

btn_in <= '0', '1' after 10 ms, '0' after 30 ms,'1' after 60 ms, '0' after 100 ms,'1' after 130 ms, '0' after 160 ms ;
reset <= '1', '0' after 180 ms;

M1:debouncer_top port map (CLOCK,reset,btn_in,btn_out);

end beh;
