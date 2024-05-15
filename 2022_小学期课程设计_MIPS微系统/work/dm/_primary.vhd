library verilog;
use verilog.vl_types.all;
entity dm is
    port(
        clk             : in     vl_logic;
        din             : in     vl_logic_vector(31 downto 0);
        we              : in     vl_logic;
        addr            : in     vl_logic_vector(13 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end dm;
