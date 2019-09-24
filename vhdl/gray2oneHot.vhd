library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity gray2oneHot is
	generic(N : natural := 4);
	port(
			G   : in  std_logic_vector(N-1 downto 0);
			OH  : out std_logic_vector(2 ** N-1 downto 0)
		 ); 

end entity;

architecture hardware of gray2oneHot is
	signal aux : natural range 0 to 2 ** N - 1;
	signal bin : std_logic_vector(N-1 downto 0);
	
begin
	-- Convertendo para binario
	bin(N-1) <= bin(N-1) xor '0';
   conversor: for i in N-2 downto 0 generate 
   bin(i) <= G(i) xor bin(i+1);
	end generate;

	-- Convertendo para oneHot
	aux <= to_integer(unsigned(bin));
	meufor: 
	for i in 2 ** (N-1) downto 0 generate
		OH(i) <= '1' when (i = aux) else '0';
	end generate;

	
end architecture;