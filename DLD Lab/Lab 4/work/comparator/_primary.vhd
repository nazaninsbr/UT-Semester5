library verilog;
use verilog.vl_types.all;
entity comparator is
    generic(
        SIZE            : integer := 16
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        A_ls_B          : out    vl_logic;
        A_gt_B          : out    vl_logic;
        A_eq_B          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end comparator;
