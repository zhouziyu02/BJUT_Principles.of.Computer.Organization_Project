library verilog;
use verilog.vl_types.all;
entity npc is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        Ins             : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        npc             : out    vl_logic_vector(31 downto 0);
        Zero            : in     vl_logic;
        JRaddr          : in     vl_logic_vector(31 downto 0)
    );
end npc;
