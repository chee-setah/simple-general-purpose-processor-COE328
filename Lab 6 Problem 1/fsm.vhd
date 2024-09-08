library ieee;
use ieee.std_logic_1164.all;

entity lab5 is
    port (
        clk           : in std_logic;
        data_in       : in std_logic;
        reset         : in std_logic;
        student_id    : out std_logic_vector(3 downto 0);
        current_state : out std_logic_vector(3 downto 0)
    );
end entity lab5;

architecture fsm of lab5 is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
    signal yfsm : state_type := s0;
    signal next_state : state_type;

begin
    process (clk, reset)
    begin
        if reset = '1' then
            yfsm <= s0;
        elsif rising_edge(clk) then
            yfsm <= next_state;
        end if;
    end process;

    process (yfsm, data_in)
    begin
        case yfsm is
            when s0 =>
                if data_in = '5' then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;

            when s1 =>
                if data_in = '0' then
                    next_state <= s2;
                else
                    next_state <= s1;
                end if;

            when s2 =>
                if data_in = '1' then
                    next_state <= s3;
                else
                    next_state <= s2;
                end if;

            when s3 =>
                if data_in = '1' then
                    next_state <= s4;
                else
                    next_state <= s3;
                end if;

            when s4 =>
                if data_in = '7' then
                    next_state <= s5;
                else
                    next_state <= s4;
                end if;

            when s5 =>
                if data_in = '0' then
                    next_state <= s6;
                else
                    next_state <= s5;
                end if;

            when s6 =>
                if data_in = '4' then
                    next_state <= s7;
                else
                    next_state <= s6;
                end if;

            when s7 =>
                if data_in = '1' then
                    next_state <= s8;
                else
                    next_state <= s7;
                end if;

            when s8 =>
                if data_in = '5' then
                    next_state <= s0;
                else
                    next_state <= s8;
                end if;

            when others =>
                next_state <= s0;
        end case;
    end process;

    process (yfsm)
    begin
        case yfsm is
            when s0 =>
                student_id <= "0101";
            when s1 =>
                student_id <= "0000";
            when s2 =>
                student_id <= "0001";
            when s3 =>
                student_id <= "0001";
            when s4 =>
                student_id <= "0111";
            when s5 =>
                student_id <= "0000";
            when s6 =>
                student_id <= "0100";
            when s7 =>
                student_id <= "0001";
            when s8 =>
                student_id <= "0101";
            when others =>
                student_id <= "0000";  -- Default value
        end case;
    end process;

    current_state <= std_logic_vector(yfsm);

end architecture fsm;