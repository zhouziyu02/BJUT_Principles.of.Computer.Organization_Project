library verilog;
use verilog.vl_types.all;
entity EXT is
    port(
        ExtOp           : in     vl_logic;
        imma            : in     vl_logic_vector(15 downto 0);
        immb            : out    vl_logic_vector(31 downto 0);
        Luisel          : in     vl_logic
    );
end EXT;
