library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity resist is 
	generic(R2 : integer := 10);
	port(
			R1     : in std_logic_vector(4 downto 0); -- 0 a 20
			Vin    : in std_logic_vector(9 downto 0); -- -500m a 500m
			sel    : in bit;
			i	    : out std_logic_vector(9 downto 0);	
			Vout	 : out std_logic_vector(14 downto 0)	
	
		);
	
end entity;

architecture hardware of resist is
	 signal R1_uns : unsigned(4 downto 0);
	 signal R2_uns : unsigned(3 downto 0);
	 signal Vin_uns, i_uns : unsigned(9 downto 0);
	 signal Vout_uns : unsigned(14 downto 0);
	 
	 
	 
begin

	R1_uns   <= unsigned(R1);
	Vin_uns  <= unsigned(Vin);
	R2_uns   <= to_unsigned(R2, 4);

	with sel select
	Vout_uns <= resize((Vin_uns*R1_uns) / (R1_uns + R2_uns), 15) when '0',
				   resize((Vin_uns*R2_uns) / (R1_uns + R2_uns), 15)when others;
	
	i_uns <= Vin_uns / (R1_uns + R2_uns);
	
	i <= std_logic_vector(i_uns);
	Vout <= std_logic_vector(Vout_uns);



end architecture;