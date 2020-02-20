library verilog;
use verilog.vl_types.all;
entity SPI is
    port(
        clk             : in     vl_logic;
        miso            : in     vl_logic;
        i_data          : in     vl_logic_vector(8 downto 0);
        o_data          : out    vl_logic_vector(8 downto 0);
        cs              : out    vl_logic;
        mosi            : out    vl_logic;
        sclk            : out    vl_logic
    );
end SPI;
