library verilog;
use verilog.vl_types.all;
entity NPC is
    port(
        curpc           : in     vl_logic_vector(31 downto 0);
        imm26           : in     vl_logic_vector(25 downto 0);
        \register\      : in     vl_logic_vector(31 downto 0);
        npc_sel         : in     vl_logic_vector(1 downto 0);
        zero            : in     vl_logic;
        nxtpc           : out    vl_logic_vector(31 downto 0);
        pc_add4         : out    vl_logic_vector(31 downto 0)
    );
end NPC;
