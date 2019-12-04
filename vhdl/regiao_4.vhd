library ieee;
use ieee.std_logic_1164.all;

entity regiao_4 is
	generic
	( 	tmax	: natural := 90;
		t5s : natural := 5;
		t50s : natural := 50;
		t10s : natural := 10;
		t30s : natural := 30);

	port (
		clk, rst, amb1, amb2, button_guarda1, button_guarda2, button_guarda3 : in STD_LOGIC;
		r1, r2, y1, y2, g1, g2: out STD_LOGIC );
end entity ;

architecture ifsc_v1 of regiao_4 is
	type state is (yy, g1r2, y1r2, r1g2, r1y2, wait1, wait2, wait3, wait4, guarda1, guarda2);
	signal pr_state, nxstate : state;
	signal timer : integer range 0 to tmax;
	--attribute ENUM_ENCODING : string; --optional attribute
	--attribute ENUM_ENCODING of state : type is "sequential";
begin

	process (clk, rst)
	variable cont : integer range 0 to tmax;
	begin
		if (rst = '1') then
			pr_state <= yy;
			cont := 0;
		elsif (clk'EVENT AND clk = '1') then
			cont := cont + 1;
			if(cont>=timer) then
				pr_state <= nxstate;
				cont := 0;
			end if;
		end if;
	end process;
	
	
	-- semaforo 1 = 10, semaforo 2 = 11
	
	process (pr_state, button_guarda1, button_guarda2, button_guarda3)
		begin
			r1 <= '0'; r2 <= '0'; g1 <= '0'; g2 <= '0'; y1 <= '0'; y2 <= '0';
			
			case pr_state is
			
				when yy =>
					y1 <= '1';
					y2 <= '1';
					timer <= 2;
					nxstate <= g1r2;
					
					if(button_guarda1 = '1')then
						nxstate <= wait1;
					elsif(button_guarda2 = '1') then
						nxstate <= wait2;
					end if;
			
					
				when g1r2 =>
					timer <= t50s;
					g1 <= '1';
					r2 <= '1';
					nxstate <= y1r2;
					
					if(button_guarda1 = '1')then
						nxstate <= wait1;
					elsif(button_guarda2 = '1') then
						nxstate <= wait2;
					end if;
			
				
				when y1r2 => 
					y1 <= '1';
					r2 <= '1';
					timer <= t5s;
					nxstate <= r1g2;
					
					if(button_guarda1 = '1')then
						nxstate <= wait1;
					elsif(button_guarda2 = '1') then
						nxstate <= wait2;
					end if;
			
					
				when r1g2 => 
					r1 <= '1';
					g2 <= '1';
					timer <= t30s;
					nxstate <= r1y2;
					
					if(button_guarda1 = '1')then
						nxstate <= wait1;
					elsif(button_guarda2 = '1') then
						nxstate <= wait2;
					end if;
			
					
				when r1y2	=>
					r1 <= '1';
					y2 <= '1';
					timer <= t5s;
					nxstate <= g1r2;
					
					if(button_guarda1 = '1')then
						nxstate <= wait1;
					elsif(button_guarda2 = '1') then
						nxstate <= wait2;
					end if;
			
					
				when guarda1 =>
					
					g1 <= '1';
					r2 <= '0';
					
					if(button_guarda3 = '1') then
						nxstate <= wait3;
					else
						nxstate <= guarda1;
					end if;
				
				when guarda2 =>
					
					g2 <= '1';
					r1 <= '0';
					
					if(button_guarda3 = '1') then
						nxstate <= wait4;
					else
						nxstate <= guarda2;
					end if;
				
				when wait1 =>
					if(button_guarda1 = '1') then
						nxstate <= wait1;
					else
						nxstate <= guarda1;
					end if;
				
				when wait2 =>
					if(button_guarda2 = '1') then
						nxstate <= wait2;
					else
						nxstate <= guarda2;
					end if;
				
				when wait3 => 
					if(button_guarda3 = '1') then
						nxstate <= wait3;
					else
						nxstate <= g1r2;
					end if;
				
				when wait4 => 
					if(button_guarda3 = '1') then
						nxstate <= wait4;
					else
						nxstate <= r1g2;
					end if;
				
			end case;
			
		end process;
	end architecture ;