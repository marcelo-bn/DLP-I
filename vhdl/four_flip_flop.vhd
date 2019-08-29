-- Declaração das bibliotecas e pacotes
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 
 -- Especificação de todas as entradas e saídas do circuito
 ENTITY four_flip_flop IS
  GENERIC(qtd : in natural := 8);
  PORT (clk, rst: IN STD_LOGIC; d: IN STD_LOGIC_VECTOR(qtd-1 downto 0);
   q: OUT STD_LOGIC_VECTOR(qtd-1 downto 0));
 END;
 
 -- Descrição de como o circuito deve funcionar
 ARCHITECTURE ifsc_v1 OF four_flip_flop IS
 BEGIN
  PROCESS (clk, rst)
  BEGIN
   IF (rst='1') THEN
		q <= (others => '0');
	 --q <= "0000";
   ELSIF (clk'EVENT AND clk='1') THEN
    q <= d;
   END IF;
  END PROCESS;
 END;