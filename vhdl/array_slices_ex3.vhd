ENTITY array_slices_ex3 IS
	PORT (
		row : IN INTEGER RANGE 0 TO 3;
		column : IN INTEGER RANGE 0 TO 4; --3 bits
		slice1 : OUT BIT;
		slice2 : OUT BIT_VECTOR(1 TO 2);
		slice3 : OUT BIT_VECTOR(1 TO 4);
		slice4 : OUT BIT_VECTOR(1 TO 3)
	);
END ENTITY;

ARCHITECTURE array_slices OF array_slices_ex3 IS
	TYPE twoD IS ARRAY (1 TO 3, 1 TO 4) OF BIT;
	CONSTANT table : twoD := (
		('0', '0', '0', '1'), -- 1
		('1', '0', '0', '1'), -- 2
		('1', '1', '0', '1')  -- 3
	 --  1    2    3    4                 table(3,3) = 0	
	);
BEGIN
	slice1 <= table(row, column);
	--slice2 <= table(row, 1 TO 2);
	--slice3 <= table(row, 1 TO 4);
	--slice4 <= table(1 TO 3, column);
	--slice4 <= table(1, column) & table(2, column) & table(3, column); --Insere as linhas no vetor de bit (slice4)
	--gen: FOR i IN 1 TO 3 GENERATE
	--slice4(i) <= table(i, column);
	--END GENERATE;
END ARCHITECTURE;