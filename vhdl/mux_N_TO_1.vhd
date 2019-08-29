library IEEE;
use IEEE.std_logic_1164.all;

entity mux_N_TO_1 is
	generic(N : natural := 4; S : natural := 2);
	port(
			x   : in  bit_vector (N-1 downto 0);
			y   : out bit;
			sel : in  bit_vector(S-1 downto 0)
	    );
end entity;

architecture hardware of mux_N_TO_1 is
begin
	y <=  x(0) when sel = "00" else
			x(1) when sel = "01" else
			x(2) when sel = "10" else
			x(3);
end architecture;

architecture hardware2 of mux_N_TO_1 is
begin
	y <=  x(0) when sel = "00" else
			x(1) when sel = "01" else
			x(2) when sel = "10" else
			x(3);
end architecture;