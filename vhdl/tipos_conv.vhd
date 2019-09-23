library IEEE;
use ieee.std_logic_1164.all;

entity tipos_conv is
	generic(N : natural := 3);
	port(
			B  : in     std_logic_vector(N-1 downto 0);
			G  : out    std_logic_vector(N-1 downto 0);
			B2 : BUFFER std_logic_vector(N-1 downto 0);
			G2 : in     std_logic_vector(N-1 downto 0)
		 ); 

end entity;

architecture bin2gray of tipos_conv is  -- Binary to Gray
begin	
	 G(N-1) <= B(N-1) xor '0';
    
    conversor: for i in N-2 downto 0 generate -- N - 2 = B'left-1 downto 0
    G(i) <= B(i) xor B(i+1);
	 end generate;
			 
end architecture;

architecture gray2bin of tipos_conv is  -- Gray to Binary
begin
	
	B2(N-1) <= G2(N-1) xor '0';
    
   conversor: for i in N-2 downto 0 generate 
   B2(i) <= G2(i) xor B2(i+1);
	end generate;
end architecture;

configuration conv_cfg of tipos_conv is
	for gray2bin end for; 
end configuration;





