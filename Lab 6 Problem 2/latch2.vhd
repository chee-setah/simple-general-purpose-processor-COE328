library ieee;
use ieee.std_logic_1164.all;

entity latch2 is
	port (
			B:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Resetn, Clock: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
		end latch2;
		
Architecture behaviour of latch2 is
begin
	process(Resetn, Clock)
	begin
		if Resetn = '0' then
			Q <= "00000000";
		elsif Clock'EVENT AND Clock = '1' then
			Q <= B;
			end if;
		end process;
	end behaviour;
	
			