library verilog;
use verilog.vl_types.all;
entity test_fifo is
    generic(
        DATA_SIZE       : integer := 8;
        ADDR_SIZE       : integer := 3
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_SIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDR_SIZE : constant is 1;
end test_fifo;
