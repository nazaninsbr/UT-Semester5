library verilog;
use verilog.vl_types.all;
entity sevenSegment is
    port(
        data_in         : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        segA            : out    vl_logic;
        segB            : out    vl_logic;
        segC            : out    vl_logic;
        segD            : out    vl_logic;
        segE            : out    vl_logic;
        segF            : out    vl_logic;
        segG            : out    vl_logic;
        segDP           : out    vl_logic
    );
end sevenSegment;
