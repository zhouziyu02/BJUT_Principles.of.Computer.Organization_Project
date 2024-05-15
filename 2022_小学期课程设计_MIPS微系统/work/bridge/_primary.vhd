library verilog;
use verilog.vl_types.all;
entity bridge is
    port(
        praddr          : in     vl_logic_vector(31 downto 0);
        rd              : out    vl_logic_vector(31 downto 0);
        wdin            : in     vl_logic_vector(31 downto 0);
        wdout           : out    vl_logic_vector(31 downto 0);
        wecpu           : in     vl_logic;
        hwintin         : in     vl_logic_vector(5 downto 0);
        hwintout        : out    vl_logic_vector(5 downto 0);
        outaddr         : out    vl_logic_vector(1 downto 0);
        outwe           : out    vl_logic;
        tcwe            : out    vl_logic;
        rd1             : in     vl_logic_vector(31 downto 0);
        rd2             : in     vl_logic_vector(31 downto 0);
        rd3             : in     vl_logic_vector(31 downto 0)
    );
end bridge;
