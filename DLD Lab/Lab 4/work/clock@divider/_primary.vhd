library verilog;
use verilog.vl_types.all;
entity clockDivider is
    generic(
        DIVISOR         : vl_logic_vector(0 to 19) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi0, Hi0)
    );
    port(
        clockIn         : in     vl_logic;
        clockOut        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DIVISOR : constant is 1;
end clockDivider;
