library verilog;
use verilog.vl_types.all;
entity EXT is
    port(
        imma            : in     vl_logic_vector(15 downto 0);
        extop           : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0);
        luisel          : in     vl_logic
    );
end EXT;
