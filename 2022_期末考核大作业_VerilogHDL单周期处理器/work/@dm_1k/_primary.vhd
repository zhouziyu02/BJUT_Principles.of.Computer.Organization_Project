library verilog;
use verilog.vl_types.all;
entity Dm_1k is
    port(
        addr            : in     vl_logic_vector(9 downto 0);
        din             : in     vl_logic_vector(31 downto 0);
        we              : in     vl_logic;
        clk             : in     vl_logic;
        dout            : out    vl_logic_vector(31 downto 0)
    );
end Dm_1k;
