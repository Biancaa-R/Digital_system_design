library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity encoder is
port(a0,a1,a2,a3,a4,a5,a6,a7 : in bit ; x,y,z : out bit);
end encoder;

architecture data of encoder is
begin
x <= (a4 or a5 or a6 or a7);
y <= (a2 or a3 or a6 or a7);
z <= (a1 or a3 or a5 or a7);
end data