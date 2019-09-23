library ieee;
use ieee.std_logic_1164.all;
 
entity tri_state is
  generic (N: NATURAL := 1);
  port 
  (
    input      : in bit;
    ena        : in bit;
    output     : out std_logic -- A saida nao pode ser bit, pois pode sair Z
  );
end entity;
 
architecture tri_state of tri_state is
begin
  output <= To_StdUlogic(input) when ena = '1' else 'Z'; -- Aspas dupla e vetor
end architecture;

-- Para localizar um componente no chip 
-- tem que ir no RTL viewer, clicar com o botao direto,
-- locate, chip planer