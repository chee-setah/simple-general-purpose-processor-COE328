library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUMod3 is
    port(
        Clock       : in std_logic;          -- input clock signal
        A, B        : in unsigned(7 downto 0); -- 8-bit inputs from latches A and B
        student_id  : in unsigned(3 downto 0); -- 4-bit student id from FSM
        OP          : in unsigned(15 downto 0); -- 16-bit selector for Operation from Decoder
        Modulus: out unsigned(3 downto 0) -- Determine whether Result is odd or even.
    );
end ALUMod3;

architecture calculation of ALUMod3 is
    -- temporary signal declarations.
   signal Reg1, Result     : unsigned(3 downto 0) := (others => '0');
	signal OddModulus: std_logic;
begin
    Reg1 <= student_id;  -- temporarily store student_id in Reg1 local variable

    process(Clock, OP) --function a
    begin
        --if rising_edge(Clock) then  -- Do the calculation (@positive edge of clock cycle.
            case OP is
                when "0000000000000001" =>
							OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
							
                when "0000000000000010" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when "0000000000000100" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
							
                when "0000000000001000" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when "0000000000010000" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when "0000000000100000" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when "0000000001000000" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when "0000000010000000" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when "0000000100000000" =>
						OddModulus <= (Reg1(0)); --LSB
							if (OddModulus = '0') then
								Result <= "0000"; --even number, N
							else
								Result <= "0001"; --odd number, Y
							end if;
						  
                when others =>
						Result <= "----";
                    -- Don't care, do nothing
            end case;
        --end if;
    end process;


	 Modulus <= Result(3 downto 0);
end calculation;
-- Since the output seven segments can only 4-bits, split the 8-bit to two 4-bits.