library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bin2oneHot is
	generic(N : natural := 4);
	port(
			B   : in  std_logic_vector(N-1 downto 0);
			OH  : out std_logic_vector(2 ** N-1 downto 0);
			int : out integer range 0 to N-1
		 ); 

end entity;

architecture hardware of bin2oneHot is
	signal aux : natural range 0 to 2 ** N - 1;
begin
	aux <= to_integer(unsigned(B));

	
	meufor: 
	for i in 2 ** (N-1) downto 0 generate
		OH(i) <= '1' when (i = aux) else '0';
	end generate;

	
end architecture;