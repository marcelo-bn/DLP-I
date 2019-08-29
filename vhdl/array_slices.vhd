-- Acessando posiçoes de um array de vetor de bits
-- Exercicio realizado em sala de aula
-- Agosto de 2019

ENTITY array_slices IS
	PORT
	(
		row : IN INTEGER RANGE 1 TO 3;
		column : IN INTEGER RANGE 1 TO 4;
		slice1 : OUT BIT;
		slice2 : OUT BIT_VECTOR(1 TO 2);
		slice3 : OUT BIT_VECTOR(1 TO 4);
		slice4 : OUT BIT_VECTOR(1 TO 3)
	);
END ENTITY;
ARCHITECTURE array_slices OF array_slices IS
	TYPE oneDoneD IS ARRAY (1 TO 3) OF BIT_VECTOR(1 TO 4);
	CONSTANT table : oneDoneD := 
               (('0', '0', '1', '1'), -- Se e possivel pegar itens na horizontal
					('1', '0', '0', '1'),
					('1', '1', '0', '1'));
BEGIN
	slice1 <= table(row)(column);  -- table(1)(1) = 0
	slice2 <= table(row)(1 TO 2);  -- table(1)(1) = 00
	slice3 <= table(row)(1 TO 4);  -- table(1)(1) = 0011
   --slice4 <= table(1 to 3)(column);
	--gen : FOR i IN 1 TO 3 GENERATE
	--slice4(i) <= table(i)(column);
	--END GENERATE;
END ARCHITECTURE;
