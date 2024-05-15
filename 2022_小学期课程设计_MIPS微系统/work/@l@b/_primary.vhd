library verilog;
use verilog.vl_types.all;
entity LB is
    port(
        DMin            : in     vl_logic_vector(31 downto 0);
        DMout           : out    vl_logic_vector(31 downto 0)
    );
end LB;
