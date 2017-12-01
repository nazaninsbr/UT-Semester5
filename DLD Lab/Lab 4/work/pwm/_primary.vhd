library verilog;
use verilog.vl_types.all;
entity pwm is
    generic(
        SIZE            : integer := 10
    );
    port(
        clk             : in     vl_logic;
        pwm_in          : in     vl_logic_vector;
        pwm_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end pwm;
