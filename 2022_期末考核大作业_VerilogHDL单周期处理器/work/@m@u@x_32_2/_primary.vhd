library verilog;
use verilog.vl_types.all;
entity MUX_32_2 is
    port(
        sel             : in     vl_logic;
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        result_32_2     : out    vl_logic_vector(31 downto 0)
    );
end MUX_32_2;
