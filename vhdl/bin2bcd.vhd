library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity bin2bcd is
	port(
		  c              : in std_logic_vector(13 downto 0);      -- Ate 9999 - 2^14
		  sm, sc, sd, su : out std_logic_vector(3 downto 0)      -- 4 bits para numeros ate 9
		 );
end entity;
-----------------------------------------------------------Arquitetura 1
architecture hardware of bin2bcd is
	signal c_uns : unsigned (6 downto 0);
	signal sd_uns, su_uns : unsigned(6 downto 0); -- Mesmo numero de bit que o dividendo 7 bit
begin
	sd <= std_logic_vector(resize(sd_uns,4)); -- sd e su estao recebendo 7 bits/necessario usar resize unsigned
	su <= std_logic_vector(resize(su_uns,4));
	sd_uns <= c_uns/10;
	su_uns <= c_uns rem 10;
	
	c_uns <= unsigned(c);
end architecture;

-----------------------------------------------------------Arquitetura 2 menos elementos logicos
architecture hardware2 of bin2bcd is
	signal c_uns                    : unsigned(9 downto 0);
	signal sc_uns, sd_uns, su_uns   : unsigned(3 downto 0); 
	signal aux							  : unsigned(6 downto 0);
begin
	c_uns  <= unsigned(c);		                 -- 10 bits   
	aux <= resize(c_uns/100,7);                 -- 7 bits  000 1001
	
	sc_uns <= resize(aux,4);                    -- 4 bits  1001          
	sd_uns <= resize((c_uns - (aux*100))/10,4); -- 4 bits          
	
	su_uns <= resize(c_uns-(aux*100)-(sd_uns*10),4);
	
	sc <= std_logic_vector(resize(sc_uns,4));
	sd <= std_logic_vector(resize(sd_uns,4)); 
	su <= std_logic_vector(resize(su_uns,4));
	
	
end architecture;

-----------------------------------------------------------Arquitetura  3 Inteiro
architecture hardware3 of bin2bcd is
	signal sd_int : integer range 0 to 9;
	signal su_int : integer range 0 to 9;
	signal c_int  : integer range 0 to 99;
begin
	c_int  <= to_integer(unsigned(c));
	sd_int <= c_int/10;
	su_int <= c_int rem 10;
	
	sd     <= std_logic_vector(to_unsigned(sd_int,4));
	su     <= std_logic_vector(to_unsigned(su_int,4));
	
end architecture;

-----------------------------------------------------------Arquitetura 4 Teste
architecture hardware4 of bin2bcd is
	signal c_uns : unsigned (6 downto 0);
	signal sd_uns, su_uns : unsigned (3 downto 0);
	
begin
	c_uns <= unsigned(c);
	
	sd_uns <= resize(c_uns/10,4);
	su_uns <= resize(c_uns - sd_uns*10,4);
	
	sd <= std_logic_vector(resize(sd_uns,4)); 
	su <= std_logic_vector(resize(su_uns,4));
	
end architecture;


-----------------------------------------------------------Arquitetura 5 menos elementos logicos
architecture hardware5 of bin2bcd is
	constant bm : natural := 4;
	signal c_uns                                : unsigned(13 downto 0);
	signal sm_uns, sc_uns, sd_uns, su_uns       : unsigned(3 downto 0); 
	signal aux1     						      	  : unsigned(bm-1 downto 0);
	signal aux2				                       : unsigned (13 downto 0);
	
  attribute keep : boolean;

  attribute keep of aux1, aux2 : signal is false;

begin

	c_uns  <= unsigned(c);		                                                                 -- 14 bits   
	
	aux1 <= resize(c_uns/to_unsigned(1000,10),bm);                                              -- 4 Bits
	aux2 <= aux1*to_unsigned(1000, 10);
	
	sm_uns <= resize(aux1, 4);                                                                  -- 4 Bits
	sc_uns <= resize((c_uns-(aux2))/to_unsigned(100,7), 4);                                     -- 4 Bits
	
	sd_uns <= resize((c_uns-(aux2)-(sc_uns*to_unsigned(100,7)))/to_unsigned(10,4), 4);          -- 4 Bits
	su_uns <= resize((c_uns-(aux2)-(sc_uns*to_unsigned(100,7))-(sd_uns*to_unsigned(10,4))), 4); -- 4 Bits
	
	sm <= std_logic_vector(sm_uns);
	sc <= std_logic_vector(sc_uns);
	sd <= std_logic_vector(sd_uns); 
   su <= std_logic_vector(su_uns);
	
	
end architecture;


-----------------------------------------------------------Configuracao de arquitetura
configuration bin2bcd_cfg of bin2bcd is
	for hardware5 end for;
end configuration;















