library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity vending_machine is
port(coin_in : in STD_LOGIC_VECTOR(2 downto 0);
clk:in STD_LOGIC;
rst: in STD_LOGIC;
soda_out: out STD_LOGIC;
change:out STD_LOGIC_VECTOR(2 downto 0));

end vending_machine;

architecture Behavioral of vending_machine is
type state_type is (off,put_money,in_1,in_2,in_3,in_5,change_1,change_3,change_5,change_4,soda);
signal current_state,next_state: state_type;
begin

--defining the clock process--

process (clk,rst)
begin
if (rst='1') then
    current_state<=off;
elsif(clk'event and clk='1') then
    current_state<=next_state;
end if;
end process;

process (current_state,coin_in)
begin

case current_state is
    when off=>
        if(rst='1') then
            change<="000";
            soda_out<='0';
            next_state<= off;
        else
            change<="000";
            soda_out<='0';
            next_state<=put_money;
           
        end if;
   
    when put_money=>
        if (coin_in="000") then
            change<="000";
            soda_out<='0';
            next_state<=put_money;
           
        elsif(coin_in="001") then
            change<="000";
            soda_out<='0';
            next_state<=in_1;
           
        elsif(coin_in="010")then
            change<="000";
            soda_out<='0';
            next_state<=in_2;
           
        elsif(coin_in="101")then
            change<="000";
            soda_out<='0';
            next_state<=in_5;
           
        end if;
       
    when in_1=>
        if (coin_in="001")then
            change<="000";
            soda_out<='0';
            next_state<=soda;
        elsif(coin_in="010")then
            change<="000";
            soda_out<='0';
            next_state<=change_1;
        elsif(coin_in="101")then
            change<="000";
            soda_out<='0';
            next_state<=change_4;   
        elsif(coin_in="000")then
            change<="000";
            soda_out<='0';
            next_state<=in_1;
           
            end if;
    when in_2=>
            change<="000";
            soda_out<='0';
            next_state<=soda;
           
    when in_3=>
            change<="000";
            soda_out<='0';
            next_state<=change_1;
           
    when in_5=>
            change<="000";
            soda_out<='0';
            next_state<=change_3;
           
    when change_1=>
            change<="001";
            soda_out<='0';
            next_state<=soda;   
           
    when change_3=>
            change<="011";
            soda_out<='0';
            next_state<=soda;
           
    when change_4=>
            change<="100";
            soda_out<='0';
            next_state<=soda;   

    when soda=>
            change<="000";
            soda_out<='1';
            next_state<=put_money;
           
    when others=>
            change<="000";
            soda_out<='0';
            next_state<=off;           
           
    end case;

end process;
end Behavioral;

