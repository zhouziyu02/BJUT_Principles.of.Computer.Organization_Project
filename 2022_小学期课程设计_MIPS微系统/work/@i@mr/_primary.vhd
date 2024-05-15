library verilog;
use verilog.vl_types.all;
entity IMr is
    port(
        clk             : in     vl_logic;
        \IRWr\          : in     vl_logic;
        PCin            : in     vl_logic_vector(31 downto 0);
        PCout           : out    vl_logic_vector(31 downto 0);
        \IRWr\          : in     vl_logic
    );
end IMr;
