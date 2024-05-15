library verilog;
use verilog.vl_types.all;
entity Controller is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2;
        s3              : integer := 3;
        s4              : integer := 4;
        s5              : integer := 5;
        s6              : integer := 6;
        s7              : integer := 7;
        s8              : integer := 8;
        s9              : integer := 9
    );
    port(
        clk             : in     vl_logic;
        op              : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        reg_sel         : out    vl_logic_vector(1 downto 0);
        alu_op          : out    vl_logic_vector(2 downto 0);
        wd_sel          : out    vl_logic_vector(1 downto 0);
        we              : out    vl_logic;
        npc_sel         : out    vl_logic_vector(1 downto 0);
        ext_op          : out    vl_logic_vector(1 downto 0);
        regwrite        : out    vl_logic;
        alu_sel         : out    vl_logic;
        addien          : out    vl_logic;
        slten           : out    vl_logic;
        lben            : out    vl_logic;
        sben            : out    vl_logic;
        pcwr            : out    vl_logic;
        irwr            : out    vl_logic;
        zero            : in     vl_logic
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
end Controller;
