library verilog;
use verilog.vl_types.all;
entity pc is
    generic(
        resetpc         : integer := 12288
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PCWr            : in     vl_logic;
        npc             : in     vl_logic_vector(31 downto 0);
        outpc           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of resetpc : constant is 1;
end pc;
