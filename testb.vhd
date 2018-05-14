library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testb is
end testb;

architecture testeo of testb is

	component ContadorLFSR is
	generic(Valor_Inicial: std_logic_vector(3 downto 0));
		port( 
				CLOCK: in std_logic;
				rst: in std_logic;
				Salidas: out std_logic_vector(3 downto 0)
		);
	end component;

	signal CLOCK: std_logic:= '0';
	signal rst: std_logic;
	signal Salidas: std_logic_vector(3 downto 0);

	
		
	begin

		CLOCK <= not CLOCK after 20 ns;
		rst <= '1', '0' after 60 ns, '1' after 200 ns;

	
	--component_label: component_name
	--[generic map(generic_assocation_list)]
	--port map (port_association_list);


	Componente_1: ContadorLFSR
	generic map ("1011")
	port map( CLOCK,rst,Salidas);

end architecture testeo;