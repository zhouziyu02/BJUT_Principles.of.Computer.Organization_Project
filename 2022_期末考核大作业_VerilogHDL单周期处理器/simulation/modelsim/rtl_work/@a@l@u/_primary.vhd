library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        Zero            : out    vl_logic;
        ALUctr          : in     vl_logic_vector(1 downto 0);
        ALUout          : out    vl_logic_vector(31 downto 0);
        \OF\            : out    vl_logic;
        addi            : in     vl_logic
    );
end ALU;
