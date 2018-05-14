library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use ieee.numeric_std.all;

entity pwm_top_test is
    
end pwm_top_test ;
 
 
architecture bhd of pwm_top_test is

signal		  CLOCK    : STD_LOGIC:='0';
signal        areset : STD_LOGIC;
signal        aload  : STD_LOGIC;
signal        data   : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal        pwm_out: STD_LOGIC;

component pwm_top is

	PORT (
        clk    : IN  STD_LOGIC;
        areset : IN  STD_LOGIC;
        aload  : IN  STD_LOGIC;
        data   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        pwm_out: OUT STD_LOGIC
    );
end component;
begin

CLOCK <= not CLOCK after 20 ns;
areset <= '1', '0' after 40 ns; --'1' after 500 ns;
aload <= '1', '0' after 40 ns, '1'after 100000 ns, '0' after 100040 ns; --'1' after 200 ns,'0' after 240 ns,'1' after 300 ns,'0' after 340 ns;
data <= "11000000","00000111" after 100000 ns ;-- "11111111" after 200 ns, "00000011" after 300 ns;
--wait until (now= 100 us);


M1: pwm_top port map (CLOCK,areset,aload,data,pwm_out);

end bhd;


