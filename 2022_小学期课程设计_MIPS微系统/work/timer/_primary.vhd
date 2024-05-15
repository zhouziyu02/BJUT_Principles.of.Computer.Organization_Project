library verilog;
use verilog.vl_types.all;
entity timer is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        devaddr         : in     vl_logic_vector(1 downto 0);
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        intreq          : out    vl_logic
    );
end timer;
