LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY dec4to16 IS
    PORT (w  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
            En : IN  STD_LOGIC ;
            Y:  OUT STD_LOGIC_VECTOR(15 DOWNTO 0))  ;
        
END dec4to16 ;

ARCHITECTURE Behavior OF dec4to16 IS
    SIGNAL Enw : STD_LOGIC_VECTOR(4 DOWNTO 0) ; 
BEGIN
    Enw <= En & w ;
    WITH Enw SELECT
    Y <=   "0000000000000001" WHEN "10000",-- 0 -- enable and W together 
           "0000000000000010" WHEN "10001",-- 1
           "0000000000000100" WHEN "10010",-- 2
           "0000000000001000" WHEN "10011",-- 3
           "0000000000010000" WHEN "10100",-- 4
           "0000000000100000" WHEN "10101",-- 5
           "0000000001000000" WHEN "10110",-- 6
           "0000000010000000" WHEN "10111",-- 7
           "0000000100000000" WHEN "11000",-- 8
           "0000001000000000" WHEN "11001",-- 9
           "0000000000000000" WHEN OTHERS;
            
END Behavior ;
