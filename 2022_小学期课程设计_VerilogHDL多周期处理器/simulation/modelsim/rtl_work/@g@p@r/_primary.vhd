library verilog;
use verilog.vl_types.all;
entity GPR is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        rw              : in     vl_logic_vector(4 downto 0);
        wd              : in     vl_logic_vector(31 downto 0);
        regwrite        : in     vl_logic;
        busA            : out    vl_logic_vector(31 downto 0);
        busB            : out    vl_logic_vector(31 downto 0);
        addi_overflow   : in     vl_logic
    );
end GPR;
