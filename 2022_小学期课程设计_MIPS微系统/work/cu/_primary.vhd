library verilog;
use verilog.vl_types.all;
entity cu is
    generic(
        s0              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        s1              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        s2              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        s3              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        s4              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        s5              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        s6              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        s7              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        s8              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        s9              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        s10             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rs              : in     vl_logic_vector(4 downto 0);
        intreq          : in     vl_logic;
        lb              : out    vl_logic;
        sb              : out    vl_logic;
        zero            : in     vl_logic;
        op              : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        overflow        : in     vl_logic;
        pcwr            : out    vl_logic;
        irwr            : out    vl_logic;
        regdst          : out    vl_logic_vector(1 downto 0);
        alusrc          : out    vl_logic;
        regwr           : out    vl_logic;
        memwr           : out    vl_logic;
        aluctr          : out    vl_logic_vector(1 downto 0);
        npcsel          : out    vl_logic_vector(2 downto 0);
        extop           : out    vl_logic;
        memtoreg        : out    vl_logic_vector(2 downto 0);
        cp0we           : out    vl_logic;
        exlclr          : out    vl_logic;
        exlset          : out    vl_logic;
        luisel          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of s0 : constant is 1;
    attribute mti_svvh_generic_type of s1 : constant is 1;
    attribute mti_svvh_generic_type of s2 : constant is 1;
    attribute mti_svvh_generic_type of s3 : constant is 1;
    attribute mti_svvh_generic_type of s4 : constant is 1;
    attribute mti_svvh_generic_type of s5 : constant is 1;
    attribute mti_svvh_generic_type of s6 : constant is 1;
    attribute mti_svvh_generic_type of s7 : constant is 1;
    attribute mti_svvh_generic_type of s8 : constant is 1;
    attribute mti_svvh_generic_type of s9 : constant is 1;
    attribute mti_svvh_generic_type of s10 : constant is 1;
end cu;
