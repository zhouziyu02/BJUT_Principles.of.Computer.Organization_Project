library verilog;
use verilog.vl_types.all;
entity mach is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0)
    );
end mach;
