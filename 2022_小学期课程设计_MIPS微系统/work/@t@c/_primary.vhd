library verilog;
use verilog.vl_types.all;
entity TC is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(3 downto 2);
        we              : in     vl_logic;
        Din             : in     vl_logic_vector(31 downto 0);
        Dout            : out    vl_logic_vector(31 downto 0);
        irq             : out    vl_logic
    );
end TC;
