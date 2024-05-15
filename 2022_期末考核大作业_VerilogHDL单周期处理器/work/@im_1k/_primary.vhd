library verilog;
use verilog.vl_types.all;
entity Im_1k is
    port(
        addr            : in     vl_logic_vector(9 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end Im_1k;
