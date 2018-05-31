library verilog;
use verilog.vl_types.all;
entity mapTable is
    generic(
        ROBsize         : integer := 32;
        mapValueSize    : vl_notype
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        decodeReadData1 : out    vl_logic_vector;
        decodeReadData2 : out    vl_logic_vector;
        decodeWriteData : in     vl_logic_vector;
        decodeReadAddr1 : in     vl_logic_vector(4 downto 0);
        decodeReadAddr2 : in     vl_logic_vector(4 downto 0);
        decodeWriteAddr : in     vl_logic_vector(4 downto 0);
        decodeRegWrite  : in     vl_logic;
        resets_i        : in     vl_logic_vector(31 downto 0);
        commitReadAddr_i: in     vl_logic_vector(4 downto 0);
        commitReadData  : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROBsize : constant is 1;
    attribute mti_svvh_generic_type of mapValueSize : constant is 3;
end mapTable;
