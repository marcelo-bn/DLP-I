-- Multiplexador 4x1
--
-- Entradas: a3, a2, a1, a0
-- Saida: x
-- Entradas de seleçao: sel10, sel11
--
-- Marcelo Bittencourt do Nascimento Filho
-- Agosto de 2019
--
-- 	sel11 sel10   x
-- -----------------------
-- 	  0     0     a0
--		  0     1     a1
--		  1     0	  a2
--		  1     1     a3	
--


library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4_to_1 is
	port(
			a   : in std_logic_vector(3 downto 0);
			sel : in std_logic_vector(1 downto 0); 
			x 	 : out std_logic
	);
end entity;

architecture hardware of mux_4_to_1 is
	begin
		with sel select 
				x <= a(0) when "00",
					  a(1) when "01",
					  a(2) when "10",
					  a(3) when "11",
					  '0' when others;
end hardware;
