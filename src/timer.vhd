library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity timer is
generic (
   CLK_FREQ : integer := 27000000
);
port (
   CLK : in std_logic;
   Q : out std_logic
);
end entity;

architecture RTL of timer is
   signal counter : std_logic_vector(31 downto 0) := (others => '0');
begin
   process (CLK)
   begin
      if rising_edge(CLK) then
         Q <= '0';
         if (unsigned(counter) < CLK_FREQ) then
            counter <= std_logic_vector(unsigned(counter) + x"01");
            Q <= '1';
         else
            counter <= (others => '0');
         end if;
      end if;
   end process;
end architecture;
