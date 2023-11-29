---------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:57:54 11/16/2023
-- Design Name:
-- Module Name:    comp_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comp_1 is
port( a1,a0,b1,b0,c1,c0 : in bit; a_g_b_g_c, b_g_a_g_c,c_g_a_g_b,a_e_b_e_c, a_e_b_g_c, b_e_c_g_a, a_e_c_g_b, a_g_b_e_c, b_g_c_e_a,c_g_a_e_b : out bit);
end comp_1;

architecture Behavioral of comp_1 is

begin
a_g_b_g_c <= (a1 and not b1 and not c1) or ( (a1 xnor b1 xnor c1) and (a0 and not b0 and not c0));
b_g_a_g_c <=(b1 and not a1 and not c1) or ( (b1 xnor a1 xnor c1) and (b0 and not a0 and not c0));
c_g_a_g_b <=(c1 and not a1 and not b1) or ( (c1 xnor a1 xnor b1) and (c0 and not a0 and not b0));
a_e_b_e_c <=(c1 xnor b1 xnor a1) and (c0 xnor b0 xnor a0);
a_e_b_g_c <= ((b1 xnor a1) and (b0 xnor a0)) and ((b1 and not c1) or ((b1 xnor c1) and (b0 and not c0)));
b_e_c_g_a <= ((b1 xnor c1) and (b0 xnor c0)) and ((b1 and not a1) or ((b1 xnor a1) and (b0 and not a0)));
a_e_c_g_b <= ((a1 xnor c1) and (a0 xnor c0)) and ((c1 and not b1) or ((c1 xnor b1) and (c0 and not b0)));
a_g_b_e_c <= ((b1 xnor c1) and (b0 xnor c0)) and ((a1 and not b1) or ((a1 xnor b1) and (a0 and not b0)));
b_g_c_e_a <= ((a1 xnor c1) and (a0 xnor c0)) and ((b1 and not a1) or ((b1 xnor a1) and (b0 and not a0)));
c_g_a_e_b <=((a1 xnor b1) and (a0 xnor b0)) and ((c1 and not a1) or ((c1 xnor a1) and (c0 and not a0)));
end Behavioral;