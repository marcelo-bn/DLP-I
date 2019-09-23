-- Conversor Binary to BCD 
-- Para numeros ate 9999
-- Numero de elementos logicos: 430
-- Atraso maximo de propagacao: X_bin[13] to U_bcd[3] = 136.894 microssegundos
-- Marcelo Bittencourt do Nascimento Filho
-- Data: Setembro de 2019

LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bin2bcd_9999 IS
	PORT 
	(
		X_bin                      : IN std_logic_vector(13 DOWNTO 0); -- Ate 9999 - 2^14
		M_bcd, C_bcd, D_bcd, U_bcd : OUT std_logic_vector(3 DOWNTO 0)  -- 4 bits para numeros ate 9
	);
END ENTITY;

ARCHITECTURE ifsc_v1 OF bin2bcd_9999 IS
	CONSTANT bm                           : NATURAL := 4;
	SIGNAL c_uns                          : unsigned(13 DOWNTO 0);
	SIGNAL sm_uns, sc_uns, sd_uns, su_uns : unsigned(3 DOWNTO 0);
	SIGNAL aux1                           : unsigned(bm - 1 DOWNTO 0);
	SIGNAL aux2                           : unsigned (13 DOWNTO 0);
 
	ATTRIBUTE keep                        : BOOLEAN;
	ATTRIBUTE keep OF aux1, aux2          : SIGNAL IS false;

BEGIN

	c_uns  <= unsigned(X_bin);                                                                              -- 14 bits 
 
	aux1   <= resize(c_uns/to_unsigned(1000, 10), bm);                                                      
	aux2   <= aux1 * to_unsigned(1000, 10);
 
	sm_uns <= resize(aux1, 4);                                                                              -- 4 Bits
	sc_uns <= resize((c_uns - (aux2))/to_unsigned(100, 7), 4);                                              -- 4 Bits
	sd_uns <= resize((c_uns - (aux2) - (sc_uns * to_unsigned(100, 7)))/to_unsigned(10, 4), 4);              -- 4 Bits
	su_uns <= resize((c_uns - (aux2) - (sc_uns * to_unsigned(100, 7)) - (sd_uns * to_unsigned(10, 4))), 4); -- 4 Bits
 
	M_bcd     <= std_logic_vector(sm_uns);
	C_bcd     <= std_logic_vector(sc_uns);
	D_bcd     <= std_logic_vector(sd_uns);
	U_bcd     <= std_logic_vector(su_uns);
 
 
END ARCHITECTURE;