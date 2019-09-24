-- Array 2D
-- Autor: Marcelo Bittencourt do Nascimento Filho
-- Data: Setembro de 2019

library IEEE;
use ieee.std_logic_1164.all;

entity array2D is
	port (
		row		: in integer range 1 to 2;
		column	: in integer range 1 to 3;
		slice1 	: out bit;
		qtd		: out integer range 1 to 6
		
	);
end entity;

architecture hardware of array2D is
	type twoD is array (1 to 2, 1 to 3) of bit;
	constant tabela : twoD := (('0','0','1'), 
										('0','1','0'));
begin

	slice1 <= tabela(row,column);
		

	
end architecture;