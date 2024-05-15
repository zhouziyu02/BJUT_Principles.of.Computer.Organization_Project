library verilog;
use verilog.vl_types.all;
entity control is
    port(
        funct           : in     vl_logic_vector(5 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        \OF\            : in     vl_logic;
        RegDst          : out    vl_logic_vector(1 downto 0);
        ALUSrc          : out    vl_logic;
        MemetoReg       : out    vl_logic_vector(1 downto 0);
        RegWrite        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ExtOp           : out    vl_logic;
        ALUctr          : out    vl_logic_vector(1 downto 0);
        N_pcsel         : out    vl_logic_vector(1 downto 0);
        slt             : out    vl_logic;
        jal             : out    vl_logic;
        addi            : out    vl_logic;
        luisel          : out    vl_logic
    );
end control;
