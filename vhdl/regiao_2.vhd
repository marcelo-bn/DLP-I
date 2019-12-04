library ieee;
use ieee.std_logic_1164.all;

entity regiao_2 is
	generic
	( 	tmax	: natural := 60;
		t5s : natural := 5;
		t10s : natural := 10;
		t20s : natural := 20;
		t25s : natural := 25);

	port (
		clk, rst, button, button_guarda : in STD_LOGIC;
		rp, rc, yc, gc, gp, led_p : out STD_LOGIC	);
end entity ;

architecture ifsc_v1 of regiao_2 is
	type state is (sem_pedestre, wait1, atencao, com_pedestre, vermelho, ocioso, wait2, wait3, guarda);
	signal pr_state, nxstate : state;
	signal timer : integer range 0 to tmax;
	--attribute ENUM_ENCODING : string; --optional attribute
	--attribute ENUM_ENCODING of state : type is "sequential";
begin

	process (clk, rst, button_guarda)
	variable cont : integer range 0 to tmax;
	begin
		if (rst = '1') then
			pr_state <= sem_pedestre;
			cont := 0;
		elsif (clk'EVENT AND clk = '1') then
			cont := cont + 1;
			if(cont>=timer) then
				pr_state <= nxstate;
				cont := 0;
			end if;
		end if;
	end process;
		
	process (pr_state, button)
		begin
			rp <= '0';
			rc <= '0';
			yc <= '0';
			gc <= '0';
			gp <= '0';
			led_p <= '0';
			
			case pr_state is		
				when sem_pedestre =>
					rp <= '1';
					gc <= '1';
					timer <= 1;
					
					if(button_guarda = '1') then
						nxstate <= wait2;
					elsif (button = '1') then
						led_p <= '1';
						nxstate <= wait1;
					else
						nxstate <= sem_pedestre;
					end if;
					
				when wait1 =>
					timer <= 1;
					if (button = '0') then
						nxstate <= atencao;
					else
						nxstate <= wait1;
					end if;
				
				when atencao => 
					yc <= '1';
					rp <= '1';
					timer <= t5s;
					nxstate <= com_pedestre;
					
				when com_pedestre => 
					rc <= '1';
					gp <= '1';
					timer <= t20s;
					nxstate <= vermelho;
					
					if(button_guarda = '1') then
						nxstate <= wait2;
					end if;
					
				when vermelho =>
					rc <= '1';
					rp <= '1';
					timer <= t5s;
					nxstate <= ocioso;
					
					if(button_guarda = '1') then
						nxstate <= wait2;
					end if;
				
				when ocioso =>
					rp <= '1';
					gc <= '1';
					timer <= t25s;
					nxstate <= sem_pedestre;
					
					if(button_guarda = '1') then
						nxstate <= wait2;
					end if;
				
				when wait2 =>
					if(button_guarda ='1') then
						nxstate <= wait2;
					else
						nxstate <= guarda;
					end if;
					
				when guarda =>
					rc <= '1';
					gp <= '1';
					
					if(button_guarda = '1') then
						nxstate <= wait3;
					else
						nxstate <= guarda;
					end if;
					
				when wait3 =>
					if(button_guarda ='1') then
						nxstate <= wait3;
					else
						nxstate <= com_pedestre;
					end if;
					
					
			end case;
		end process;
		end architecture ;