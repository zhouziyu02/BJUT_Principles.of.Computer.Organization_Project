library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        busA            : in     vl_logic_vector(31 downto 0);
        busB            : in     vl_logic_vector(31 downto 0);
        ALUctr          : in     vl_logic_vector(1 downto 0);
        ALUout          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic;
        \OF\            : out    vl_logic;
        addi            : in     vl_logic
    );
end ALU;
