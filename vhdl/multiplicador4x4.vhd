LIBRARY ieee;
USE ieee.numeric_std.all;
 
ENTITY multiplicador4x4 IS
 
-- multiplicador usando INTEGER (positivos)
-- PORT (a, b: IN INTEGER RANGE 0 TO 15;   -- min(a) = 0; max(a) = 15       -> 4 bits
-- y: OUT INTEGER RANGE 0 TO 225);         -- min(a*b) = 0, max(a*b) = 225  -> 8 bits

-- multiplicador usando INTEGER (positivos e negativos)
   PORT (a, b: IN INTEGER;   				-- min(a) = -8; max(a) = 7       -> 4 bits
			y: OUT INTEGER);        -- min(a*b) = -56, max(a*b) = 64 -> 8 bits 
 
-- multiplicador usando UNSIGNED
-- PORT (a, b: IN UNSIGNED(3 DOWNTO 0);    -- min(a) = 0; max(a) = 15       <- 4 bits
-- y: OUT UNSIGNED(7 DOWNTO 0));           -- min(a*b) = 0, max(a*b) = 225  -> 8 bits
 
-- multiplicador usando SIGNED
-- PORT (a, b: IN SIGNED(3 DOWNTO 0);      -- min(a) = -8; max(a) = 7       <- 4 bits 
-- y: OUT SIGNED(7 DOWNTO 0));             -- min(a*b) = -56, max(a*b) = 64 -> 8 bits
 
 
-- multiplicador usando STD_LOGIC_VECTOR
-- PORT (a, b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);    -- min(a) = 0; max(a) = 15       <- 4 bits
-- y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));           -- min(a*b) = 0, max(a*b) = 225  -> 8 bits
 
-- multiplicador usando STD_LOGIC_VECTOR
-- PORT (a, b: STD_LOGIC_VECTOR(3 DOWNTO 0);       -- min(a) = -8; max(a) = 7       <- 4 bits 
-- y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));           -- min(a*b) = -56, max(a*b) = 64 -> 8 bits
 
 
END ENTITY;
 
ARCHITECTURE v1 OF multiplicador4x4 IS
BEGIN
 y <= a * b;
END ARCHITECTURE;