library ieee;
use ieee.std_logic_1164.all;

entity latch1 is
	port (
			A:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Resetn, Clock: IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
		end latch1;
		
architecture behaviour of latch1 is
begin
	process(Resetn, Clock)
	begin
		if Resetn = '0' then
			Q <= "00000000";
		elsif Clock'EVENT AND Clock = '1' then
			Q <= A;
			end if;
		end process;
	end behaviour;
	
			