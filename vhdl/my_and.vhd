-- Porta logica AND descrita em VHDL
-- Autor: Marcelo Bittencourt do Nascimento Filho
-- Data: Agosto de 2019

	library IEEE;						-- Adicionando biblioteca
	use IEEE.std_logic_1164.all;	-- Biblioteca padrao 1164
	
	entity my_and is port			-- Declarando entradas
	(
		a : in std_logic;					-- Entrada digital a
		b : in std_logic;					-- Entrada digital b
		o : out std_logic					-- Saida digital o				
	);
	end my_and;							-- Final da declaraao

	architecture hardware of my_and is
	begin		
		--process(a,b)
		--begin
		--	if (a='1') then
		--		if (b='1') then
		--			o <= '1';
		--		end if;			
		--	else 
		--		o <= '0';
		--	end if;
		--end process;
		o <= a and b;
	end;
	