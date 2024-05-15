library verilog;
use verilog.vl_types.all;
entity SB is
    port(
        busB            : in     vl_logic_vector(31 downto 0);
        DMout           : in     vl_logic_vector(31 downto 0);
        SB_out          : out    vl_logic_vector(31 downto 0)
    );
end SB;
