library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Behavioural describes a systems behaviour or a function in a alogrithmic fashion
--It is abstract it doesnt imply a direct gate level implementation;
--Each process statement is a concurrent statement which would contain seqental statements inside

entity half_add1 is
    port(a,b : in bit;
    sum,carry : out bit);
    end half_add1;
   
architecture Behavioral of half_add1 is
    begin
    ha : process (a,b)
    begin
        if a='1' then
            sum<= not b;
            carry <= b;
        else
            sum<=b;
            carry <='0';
        end if;
        end process ha;
    end Behavioral;

