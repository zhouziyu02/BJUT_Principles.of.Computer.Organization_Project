library verilog;
use verilog.vl_types.all;
entity MUX_5 is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        data1           : in     vl_logic_vector(4 downto 0);
        data2           : in     vl_logic_vector(4 downto 0);
        data3           : in     vl_logic_vector(4 downto 0);
        data4           : in     vl_logic_vector(4 downto 0);
        result_5        : out    vl_logic_vector(4 downto 0)
    );
end MUX_5;
