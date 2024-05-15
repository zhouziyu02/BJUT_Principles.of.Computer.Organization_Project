library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        nxtpc           : in     vl_logic_vector(31 downto 0);
        curpc           : out    vl_logic_vector(31 downto 0);
        pcwr            : in     vl_logic
    );
end PC;
