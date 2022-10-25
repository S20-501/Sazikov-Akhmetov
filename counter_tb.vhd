
library ieee;
use ieee.std_logic_1164.all;

entity tb_counter is
end tb_counter;

architecture tb of tb_counter is

    component counter
        port (C   : in std_logic;
              CLR : in std_logic;
              Q   : out std_logic_vector (3 downto 0));
    end component;

    signal C   : std_logic;
    signal CLR : std_logic;
    signal Q   : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 1000 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : counter
    port map (C   => C,
              CLR => CLR,
              Q   => Q);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    C <= TbClock;

    stimuli : process
    begin

        CLR <= '1';
        wait for 100 ns;
        CLR <= '0';
        wait for 100 ns;

        wait for 100 * TbPeriod;

	CLR <= '1' after 10 ns, '0' after 20 ns;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;


configuration cfg_tb_counter of tb_counter is
    for tb
    end for;
end cfg_tb_counter;
