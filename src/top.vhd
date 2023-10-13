library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity top is
   port (
      CLK_27M : in std_logic;
      KEY : in std_logic;
      LED : out std_logic
   );
END entity;

architecture RTL of top is
   signal address : std_logic_vector(0 downto 0) := (others => '0');
   signal led_data : std_logic_vector(7 downto 0) := (others => '0');
   signal address_toggle : std_logic;

   component spram
    generic (
      addrbits : integer;
      databits : integer;
      init_file : string
    );
    port (
      address : in STD_LOGIC_VECTOR (addrbits-1 downto 0);
      clock : in STD_LOGIC;
      data : in STD_LOGIC_VECTOR (databits-1 downto 0);
      wren : in STD_LOGIC;
      q : out STD_LOGIC_VECTOR (databits-1 downto 0)
    );
  end component;


   component timer is
   port (
      CLK : in std_logic;
      Q : out std_logic
   );
   end component;
begin
   led_spram : spram
   generic map (
      addrbits => 1,
      databits => 8,
      init_file => "../roms/led.mem"
   )
   port map (
      address => address,
      clock => CLK_27M,
      data => (others => '0'),
      wren => '0',
      q => led_data
   );

   led_address_timer : entity work.timer
   port map (
      CLK => CLK_27M,
      Q => address_toggle
   );

   process (CLK_27M)
   begin
      if rising_edge(CLK_27M) then
         if (address_toggle = '1') then
            address <= not address;
         end if; 
      end if;
   end process;

   LED <= led_data(0);
end RTL;