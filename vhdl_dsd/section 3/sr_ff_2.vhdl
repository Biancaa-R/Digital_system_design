library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_2 is
PORT( S : IN STD_LOGIC;
R : IN STD_LOGIC;
Q : INOUT STD_LOGIC:='0';
Q_BAR : INOUT STD_LOGIC:='0';
--we are defining as inout as its a output and we assign a default value to it.
clk : in std_logic;
rst : in std_logic);

end sr_2;

architecture Behavioral of sr_2 is
begin

process(clk ,rst)
    begin
    if (rst='1') then
        Q<='0';
        Q_BAR<='0';
    elsif (clk' event and clk='1') then
        if (R/=S) then
            Q<=S;
            Q_BAR<=R;
        elsif( R='1' and Q='1')then
            Q<='Z';
            Q_BAR<='Z';
        else
            Q<=Q;
            Q_BAR<=Q_BAR;
        end if;
    end if;
end process;


end Behavioral;

