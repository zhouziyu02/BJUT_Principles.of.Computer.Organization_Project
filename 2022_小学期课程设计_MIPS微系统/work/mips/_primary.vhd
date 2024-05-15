library verilog;
use verilog.vl_types.all;
entity mips is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rdd             : in     vl_logic_vector(31 downto 0);
        wdin            : out    vl_logic_vector(31 downto 0);
        praddr          : out    vl_logic_vector(31 downto 0);
        wecpu           : out    vl_logic;
        cp0rd           : in     vl_logic_vector(31 downto 0);
        cp0addr         : out    vl_logic_vector(4 downto 0);
        cp0we           : out    vl_logic;
        exlset          : out    vl_logic;
        exlclr          : out    vl_logic;
        pc4             : out    vl_logic_vector(31 downto 0);
        epcin           : in     vl_logic_vector(31 downto 0);
        intreq          : in     vl_logic
    );
end mips;
