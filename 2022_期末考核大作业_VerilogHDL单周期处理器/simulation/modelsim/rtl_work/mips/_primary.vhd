library verilog;
use verilog.vl_types.all;
entity mips is
    generic(
        jalreg          : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi1, Hi1, Hi1);
        jrreg           : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi1, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of jalreg : constant is 1;
    attribute mti_svvh_generic_type of jrreg : constant is 1;
end mips;
