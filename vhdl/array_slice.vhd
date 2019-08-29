library IEEE;
use ieee.std_logic_1164.all;

entity array_slice is 
	port (row  : in integer range 1 to 3;
		  slice : out integer range 0 to 15);
end entity;

architecture hardware of array_slice is
    type oneDoneD is array (1 to 3) of integer range 0 to 15;
    constant table: oneDoneD := (3, 9, 13);
begin
    slice <= table(row);
end architecture hardware;