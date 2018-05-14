library ieee;

use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_b_up is
end entity ;

architecture bh of test_b_up is

signal CLOCK: std_logic:= '0';
signal rst: std_logic;
	
signal 	s	:  std_logic_vector(6 downto 0);
signal	SEL_t :  std_logic_vector(1 downto 0);

signal c01,c11,c21,c31,Muestra : std_logic_vector(3 downto 0);

signal aload : std_logic:= '0';

	component Contador is

		port(
			c0,c1,c2,c3 : out std_logic_vector(3 downto 0);
			s	: out std_logic_vector(6 downto 0);
			aload  : IN  STD_LOGIC;
			SEL : in std_logic_vector(1 downto 0);
			CLOCK: in std_logic;
			rst: in std_logic;
			Muestra: out std_logic_vector(3 downto 0)
			);
end component;

begin	
CLOCK <= not CLOCK after 20 ns;
rst <= '1', '0' after 40 ns, '1' after 560 ns;
aload <= '0','1' after 10 ns, '0' after 50 ns;

Compo: Contador port map(c01,c11,c21,c31,s,aload,SEL_t,CLOCK,rst,Muestra);




READ_NET: process
	begin


SEL_t(0) <= '0' after 20 ns,	
				'1' after 100 ns,
				'0' after 180 ns,	
				'1' after 260 ns,
				'0' after 340 ns,	
				'1' after 400 ns,
				'0' after 480 ns,	
				'1' after 560 ns;

SEL_t(1) <= '0' after 20 ns,	
				'0' after 100 ns,
				'1' after 180 ns,	
				'1' after 260 ns,
				'0' after 340 ns,	
				'0' after 400 ns,
				'1' after 480 ns,	
				'1' after 560 ns;
wait;

end process;


end architecture bh;
