LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY ssegMod IS
	PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			leds: OUT STD_LOGIC_VECTOR(0 TO 6));
	END ssegMod;

ARCHITECTURE Behavior OF ssegMod IS
	BEGIN
	PROCESS (bcd)

BEGIN
	
		CASE bcd IS --abcdefg, 0 = ON, 1 = OFF
	WHEN "0000" =>leds <= ("0001001"); --N
	WHEN "0001" =>leds <= ("1000100"); --Y
	
	WHEN OTHERS =>leds <= ("-------");
		END CASE;
		
END PROCESS;
END Behavior;