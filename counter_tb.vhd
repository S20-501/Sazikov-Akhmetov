-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 24.10.2022 17:26:54 UTC

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

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : counter
    port map (C   => C,
              CLR => CLR,
              Q   => Q);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    C <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        --C <= '0';

        -- Reset generation
        -- EDIT: Check that CLR is really your reset signal
        CLR <= '1';
        wait for 100 ns;
        CLR <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;
	--C <= not C after 10 ns;
	CLR <= '1' after 2000 ns, '0' after 3000 ns;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_counter of tb_counter is
    for tb
    end for;
end cfg_tb_counter;