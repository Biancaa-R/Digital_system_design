----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    17:55:10 11/29/2023
-- Design Name:
-- Module Name:    bcd_xs3 - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_xs3 is
port (x3,x2,x1,x0 : in std_logic; y0,y1,y2,y3 : out STD_logic);
end bcd_xs3;

architecture dataflow of bcd_xs3 is
begin
y3 <= (x3 or (x2 and x0) or (x2 and x1));
y2 <= (((not x1 and not x0) and x2) or (not x2 and x0) or (x1 and not x2));
y1 <= (x1 and x0 ) or (not x1 and not x0);
y0 <=    (x1 and not x0 ) or (not x1 and not x0);

end dataflow;