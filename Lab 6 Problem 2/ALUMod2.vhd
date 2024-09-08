library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUMod2 is
    port(
        Clock       : in std_logic;          -- input clock signal
        A, B        : in unsigned(7 downto 0); -- 8-bit inputs from latches A and B
        student_id  : in unsigned(3 downto 0); -- 4-bit student id from FSM
        OP          : in unsigned(15 downto 0); -- 16-bit selector for Operation from Decoder
        Neg         : out std_logic;          -- is the result negative? Set-ve bit output
        R1, R2      : out unsigned(3 downto 0) -- lower 4-bits of 8-bit Result Output, higher 4-bits of 8-bit Result Output
    );
end ALUMod2;

architecture calculation of ALUMod2 is
    -- temporary signal declarations.
    signal Reg1, Reg2, Result     : unsigned(7 downto 0) := (others => '0');

begin
    Reg1 <= A;  -- temporarily store A in Reg1 local variable
    Reg2 <= B;  -- temporarily store B in Reg2 local variable

    process(Clock, OP) --function b
    begin
        if rising_edge(Clock) then  -- Do the calculation (@positive edge of clock cycle.
            case OP is
                when "0000000000000001" =>
						Result(7) <= Reg1(3);
						Result(6) <= Reg1(2);
						Result(5) <= Reg1(1);
						Result(4) <= Reg1(0);
						
						Result(3) <= Reg1(7);
						Result(2) <= Reg1(6);
						Result(1) <= Reg1(5);
						Result(0) <= Reg1(4);
						Neg <= '0';
                    -- Swap the upper and lower 4 bits of A
						  
                when "0000000000000010" =>
						Result <= (Reg1 OR Reg2);
						Neg <= '0';		
                    -- Produce the result of  ORing A and B
						  
                when "0000000000000100" =>
						Result <= Reg2 - "00000101";
					
                    -- Decrement B by 5
						 
                when "0000000000001000" =>
						Result(7) <= NOT Reg1(7);
						Result(6) <= NOT Reg1(6);
						Result(5) <= NOT Reg1(5);
						Result(4) <= NOT Reg1(4);
						
						Result(3) <= NOT Reg1(3);
						Result(2) <= NOT Reg1(2);
						Result(1) <= NOT Reg1(1);
						Result(0) <= NOT Reg1(0);
						Neg <= '0';
                    -- Invert all bits of A
						  
                when "0000000000010000" =>
						Result(7) <= Reg1(0);
						Result(6) <= Reg1(1);
						Result(5) <= Reg1(2);
						Result(4) <= Reg1(3);
						
						Result(3) <= Reg1(4);
						Result(2) <= Reg1(5);
						Result(1) <= Reg1(6);
						Result(0) <= Reg1(7);
						Neg <= '0';
                    -- Invert the bit significance order of A
						  
                when "0000000000100000" =>
							if (Reg1 > Reg2) then
						Result <= Reg1;
							else
						Result <= Reg2;
					end if;
					Neg <= '0';	
                    -- Find the greater value of A and B and produce the results ( Max(A,B) )
						  
                when "0000000001000000" =>
						Result <= Reg1 - Reg2;
							if (Reg2 > Reg1) then
								Neg <= '1';
						Result <= (NOT Reg1) + Reg2 + 1; --two's complement
							end if;
							
                    -- Produce the difference between A and B
						  
                when "0000000010000000" =>
						Result <= (Reg1 XNOR Reg2);
						Neg <= '0';
                    -- Produce the result of XNORing A and B
						  
                when "0000000100000000" =>
						Result <= (Reg2 ROL 3);
						Neg <= '0';
                    -- Rotate B to left by three bits (ROL)
						  
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