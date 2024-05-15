library verilog;
use verilog.vl_types.all;
entity outDev is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end outDev;
