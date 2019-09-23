library ieee;
use ieee.std_logic_1164.all;
 
entity dont_care is
  port 
  (
    x : in STD_LOGIC_VECTOR(1 downto 0);
    y : out STD_LOGIC_VECTOR(1 downto 0)
  );
end entity;
 
architecture un3 of dont_care is
begin
  y <= "00" when x = "00" else
       "01" when x = "10" else
       "10" when x = "01" else
       "--";
end architecture;

--    x          y
-- x1   x0	|	y1   y0
-------------------------
-- 0     0  |  0     0
-- 0     1  |  1     0
-- 1     0  |  0     1
--    .		|	  --
--    .
--    .

-- Para ver o mapa de karnaugh tem que ir em Netlist > Technology
-- > seleciornar o circuito > botao direito > propriedades