----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    05:05:09 12/31/2023
-- Design Name:
-- Module Name:    sr_ff - Behavioral
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

entity sr_ff is
PORT(s : in std_logic;
r: in std_logic;
clk:in std_logic;
rst: in std_logic;
q : out std_logic;
q_bar : out std_logic);
end sr_ff;

architecture Behavioral of sr_ff is

begin
process(clk)
variable temp:std_logic;
begin
if (rst='1') then
    q<='0';
    q_bar<='0';
elsif(clk' event and clk='1') then
        if (s='0' and r='0') then
            temp:=temp;
           
        elsif(s='1' and r='1') then
            temp:='Z';
           
        else
            if(s='1') then
                temp:='1';
            else
                temp:='0';
            end if;
        end if;
    end if;
q<= temp;
q_bar<= not temp;

end process;
end Behavioral;