library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	generic(N : integer := 2);
	port(
			a, b   : in std_logic_vector(N-1 downto 0);
			opcode : in std_logic_vector(3 downto 0);
			cin    : in std_logic_vector(0 downto 0);
			y      : out std_logic_vector(N-1 downto 0)
		);
end entity;

architecture ifsc_v1 of ALU is
	signal a_uns, b_uns : unsigned(N-1 downto 0); 
	signal cin_uns      : unsigned(0 downto 0);
begin

	a_uns <= unsigned(a);
	b_uns <= unsigned(b);
	cin_uns <= unsigned(cin);

	with opcode select
	y <= not a                                      when "0000",
		  not b                                      when "0001",
		  a and b                                    when "0010",
		  a or b                                     when "0011",
		  a nand b                                   when "0100",
		  a nor b                                    when "0101",
		  a xor b                                    when "0110",
		  a xnor b                                   when "0111",

		  std_logic_vector(a_uns)    	               when "1000",
		  std_logic_vector(b_uns)		               when "1001",
		  std_logic_vector(a_uns + 1)                when "1010",
		  std_logic_vector(b_uns + 1)                when "1011",
		  std_logic_vector(a_uns - 1)                when "1100",
		  std_logic_vector(b_uns - 1)                when "1101",
		  std_logic_vector(a_uns + b_uns) 	         when "1110",
		  std_logic_vector(a_uns + b_uns + cin_uns)	when others;
		  
	  
end architecture;

architecture ifsc_v2 of ALU is
	signal a_uns, b_uns : unsigned(N-1 downto 0); 
	signal cin_uns      : unsigned(0 downto 0);
	signal y_logic      : std_logic_vector(N-1 downto 0); 
	signal y_arith      :  unsigned(N-1 downto 0);
begin

	a_uns <= unsigned(a);
	b_uns <= unsigned(b);
	cin_uns <= unsigned(cin);

	logic: with opcode(2 downto 0) select
	y_logic <= not a                        when "000",
		        not b                        when "001",
		        a and b                      when "010",
		        a or b                       when "011",
		        a nand b                     when "100",
		        a nor b                      when "101",
		        a xor b                      when "110",
		        a xnor b                     when others;
			
   arith: with opcode(2 downto 0) select
	y_arith <=  a_uns    	                when "000",
		         b_uns		                   when "001",
		         a_uns + 1                   when "010",
		         b_uns + 1                   when "011",
		         a_uns - 1                   when "100",
		         b_uns - 1                   when "101",
		         a_uns + b_uns 	             when "110",
		         a_uns + b_uns + cin_uns	    when others;

   saida: with opcode(0 downto 0) select
		y <= y_logic when "0",
			  std_logic_vector(y_arith) when others;	



	

end architecture;

configuration ALU_cfg of ALU is
	for ifsc_v2 end for;
end configuration;
