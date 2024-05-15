library verilog;
use verilog.vl_types.all;
entity npc is
    port(
        imm             : in     vl_logic_vector(31 downto 0);
        JRaddr          : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        zero            : in     vl_logic;
        pc              : in     vl_logic_vector(31 downto 0);
        npc             : out    vl_logic_vector(31 downto 0);
        epcin           : in     vl_logic_vector(31 downto 0)
    );
end npc;
