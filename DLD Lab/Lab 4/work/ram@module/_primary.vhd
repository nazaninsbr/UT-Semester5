library verilog;
use verilog.vl_types.all;
entity ramModule is
    generic(
        DATA_SIZE       : integer := 32;
        ADDR_SIZE       : integer := 32;
        RAM_SIZE        : vl_notype
    );
    port(
        address_0       : in     vl_logic_vector;
        data_0          : inout  vl_logic_vector;
        cs_0            : in     vl_logic;
        we_0            : in     vl_logic;
        oe_0            : in     vl_logic;
        address_1       : in     vl_logic_vector;
        data_1          : inout  vl_logic_vector;
        cs_1            : in     vl_logic;
        we_1            : in     vl_logic;
        oe_1            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_SIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDR_SIZE : constant is 1;
    attribute mti_svvh_generic_type of RAM_SIZE : constant is 3;
end ramModule;
