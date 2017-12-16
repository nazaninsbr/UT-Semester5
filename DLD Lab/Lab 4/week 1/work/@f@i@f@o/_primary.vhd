library verilog;
use verilog.vl_types.all;
entity FIFO is
    generic(
        DATA_SIZE       : integer := 32;
        ADDR_SIZE       : integer := 32;
        RAM_SIZE        : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rd_cs           : in     vl_logic;
        rd_en           : in     vl_logic;
        wr_cs           : in     vl_logic;
        wr_en           : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector;
        empty           : out    vl_logic;
        full            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_SIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDR_SIZE : constant is 1;
    attribute mti_svvh_generic_type of RAM_SIZE : constant is 3;
end FIFO;
