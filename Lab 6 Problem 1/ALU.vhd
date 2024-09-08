library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port(
        Clock       : in std_logic;          -- input clock signal
        A, B        : in unsigned(7 downto 0); -- 8-bit inputs from latches A and B
        student_id  : in unsigned(3 downto 0); -- 4-bit student id from FSM
        OP          : in unsigned(15 downto 0); -- 16-bit selector for Operation from Decoder
        Neg         : out std_logic;          -- is the result negative? Set-ve bit output
        R1, R2      : out unsigned(3 downto 0) -- lower 4-bits of 8-bit Result Output, higher 4-bits of 8-bit Result Output
    );
end ALU;

architecture calculation of ALU is
    -- temporary signal declarations.
    signal Reg1, Reg2, Result     : unsigned(7 downto 0) := (others => '0');

begin
    Reg1 <= A;  -- temporarily store A in Reg1 local variable
    Reg2 <= B;  -- temporarily store B in Reg2 local variable

    process(Clock, OP)
    begin
        if rising_edge(Clock) then  -- Do the calculation (@positive edge of clock cycle.
            case OP is
                when "0000000000000001" =>
						Result <= Reg1 + Reg2;
						Neg <= '0';
                    -- Do Addition for Reg1 and Reg2
                when "0000000000000010" =>
						Result <= Reg1 - Reg2;
							if (Reg2 > Reg1) then
								Neg <= '1';
						Result <= (NOT Reg1) + Reg2 + 1; --two's complement
							end if;
                    -- Do Subtraction
                    -- "Neg" bit set if required.
                when "0000000000000100" =>
						Result <= (NOT Reg1);
						Neg <= '0';
                    -- Do Inverse
						 
                when "0000000000001000" =>
						Result <= (NOT (Reg1 AND Reg2));
						Neg <= '0';
                    -- Do Boolean NAND
						  
                when "0000000000010000" =>
						Result <= (NOT (Reg1 OR Reg2));
						Neg <= '0';
                    -- Do Boolean NOR
						  
                when "0000000000100000" =>
						Result <= (Reg1 AND Reg2);
						Neg <= '0';
                    -- Do Boolean AND
						  
                when "0000000001000000" =>
						Result <= (Reg1 XOR Reg2);
						Neg <= '0';
                    -- Do Boolean XOR
						  
                when "0000000010000000" =>
						Result <= (Reg1 OR Reg2);
						Neg <= '0';
                    -- Do Boolean OR
						  
                when "0000000100000000" =>
						Result <= (Reg1 XNOR Reg2);
						Neg <= '0';
                    -- Do Boolean XNOR
                when others =>
						Result <= "--------";
                    -- Don't care, do nothing
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);
end calculation;
-- Since the output seven segments can only 4-bits, split the 8-bit to two 4-bits.