library verilog;
use verilog.vl_types.all;
entity CP0 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        datain          : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        regaddr         : in     vl_logic_vector(4 downto 0);
        we              : in     vl_logic;
        exlset          : in     vl_logic;
        exlclr          : in     vl_logic;
        pcin            : in     vl_logic_vector(31 downto 0);
        epcout          : out    vl_logic_vector(31 downto 0);
        intreq          : out    vl_logic;
        hwint           : in     vl_logic_vector(5 downto 0)
    );
end CP0;
