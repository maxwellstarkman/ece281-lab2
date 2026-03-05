library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_basys3 is
    port(
        -- 7-segment display segments (cathodes CG ... CA)
        seg : out std_logic_vector(6 downto 0);
        -- 7-segment display active-low enables (anodes)
        an  : out std_logic_vector(3 downto 0);
        -- Switches
        sw  : in  std_logic_vector(3 downto 0);
        -- Buttons
        btnC: in  std_logic
    );
end top_basys3;

architecture top_basys3_arch of top_basys3 is
    -- declare the component of your top-level design
    component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component sevenseg_decoder;

    -- create wire to connect button to 7SD enable (active-low)
    signal w_7SD_EN_n : std_logic;

begin
    -- PORT MAPS ---------------------------------------
    sevenseg_decoder_inst: sevenseg_decoder
    port map(
        i_Hex => sw(3 downto 0),
        o_seg_n => seg
    );

    -- CONCURRENT STATEMENTS ---------------------------
    -- wire up active-low 7SD anode to button (active-high)
    -- display 7SD 0 only when button pushed
    -- other 7SD are kept off
    w_7SD_EN_n <= not btnC;

    an(0) <= w_7SD_EN_n;
    an(1) <= '1';
    an(2) <= '1';
    an(3) <= '1';

end top_basys3_arch;