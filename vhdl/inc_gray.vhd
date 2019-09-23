--	Incrementador codigo Gray N-Bits
--	Autor: Marcelo Bittencourt do Nascimento Filho
--	Data: Setembro de 2019
--	Instituto Federal de Santa Catarina - Sao Jose


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity inc_gray is
	generic(N : natural := 10);
	port(
			gray_in    : in  std_logic_vector(N-1 downto 0);
		   gray_out   : out std_logic_vector(N-1 downto 0)
			
		 ); 

end entity;

architecture hardware of inc_gray is
	signal B, B_aux : std_logic_vector(N-1 downto 0);
	signal aux, aux2 : unsigned(N-1 downto 0);
begin
	--Convertendo entrada para binario
	B(N-1) <= gray_in(N-1) xor '0';
    
   grayTobin: for i in N-2 downto 0 generate 
   B(i) <= gray_in(i) xor B(i+1);
	end generate;
	
	--Realizando o incremento em binario
	aux  <= unsigned(B);
	aux2 <= aux + 1;
	
	B_aux <= std_logic_vector(aux2);
	
	--Convertendo binario para Gray
	gray_out(N-1) <= B_aux(N-1) xor '0';
    
   binToGray: for i in N-2 downto 0 generate 
   gray_out(i) <= B_aux(i) xor B_aux(i+1);
	end generate;



end architecture;