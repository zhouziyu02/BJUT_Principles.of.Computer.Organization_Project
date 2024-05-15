library verilog;
use verilog.vl_types.all;
entity lb is
    port(
        din             : in     vl_logic_vector(31 downto 0);
        lb_sel          : in     vl_logic_vector(1 downto 0);
        dout            : out    vl_logic_vector(31 downto 0);
        lben            : in     vl_logic
    );
end lb;
