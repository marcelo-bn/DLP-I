--File: mux1Dx1D.vhd
use work.meu_pkg.all;

entity mux1Dx1D is
  generic (M : natural := 8);
  port (
    x   : in array1Dx1D(M-1 downto 0);
    sel : in integer range 0 to M-1;
    y   : out bit_vector(Nbit-1 downto 0)
  );
end entity;

architecture ifsc of mux1Dx1D is
begin
  y <= x(sel);
end architecture;