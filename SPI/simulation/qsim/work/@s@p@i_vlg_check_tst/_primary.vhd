library verilog;
use verilog.vl_types.all;
entity SPI_vlg_check_tst is
    port(
        cs              : in     vl_logic;
        mosi            : in     vl_logic;
        o_data          : in     vl_logic_vector(8 downto 0);
        sclk            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SPI_vlg_check_tst;
