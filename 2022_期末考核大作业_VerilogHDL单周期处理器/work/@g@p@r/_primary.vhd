library verilog;
use verilog.vl_types.all;
entity GPR is
    port(
        ra              : in     vl_logic_vector(4 downto 0);
        rb              : in     vl_logic_vector(4 downto 0);
        rw              : in     vl_logic_vector(4 downto 0);
        we              : in     vl_logic;
        busa            : out    vl_logic_vector(31 downto 0);
        busb            : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        busw            : in     vl_logic_vector(31 downto 0)
    );
end GPR;
