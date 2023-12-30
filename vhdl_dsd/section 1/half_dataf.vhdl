--Data flow modelling decribed by concurrent signal assignment statements
--It describes the system based on how data flows into a system
--Data dependencies match those in hardware implementation.
--directly implies a Corresponding gate implementation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_add is
    port(a,b : in bit;
    sum,carry:out bit);
    end half_add;

architecture Dataflow of half_add is
    begin
    sum<= a xor b;
    carry <= a and b;
    end Dataflow;
   
