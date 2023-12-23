
library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder1 is
port(a,b,c : in bit; so,co :out bit);
end full_adder1;

architecture Behavioral of full_adder1 is

begin
    so <= a xor b xor c;
    co <= (c and( b xor a)) or (a and b);
   
end Behavioral;
