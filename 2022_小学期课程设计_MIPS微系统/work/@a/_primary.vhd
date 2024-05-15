library verilog;
use verilog.vl_types.all;
entity A is
    port(
        clk             : in     vl_logic;
        Ain             : in     vl_logic_vector(31 downto 0);
        Aout            : out    vl_logic_vector(31 downto 0)
    );
end A;
