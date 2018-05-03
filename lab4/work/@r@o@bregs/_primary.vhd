library verilog;
use verilog.vl_types.all;
entity ROBregs is
    generic(
        ROBsize         : integer := 32;
        addrSize        : vl_notype
    );
    port(
        clk_i           : in     vl_logic;
        resets_i        : in     vl_logic_vector;
        decodeReadAddr1_i: in     vl_logic_vector;
        decodeReadAddr2_i: in     vl_logic_vector;
        decodeWriteAddr_i: in     vl_logic_vector;
        decodeWriteEn_i : in     vl_logic;
        decodeReadData1_o: out    vl_logic_vector(69 downto 0);
        decodeReadData2_o: out    vl_logic_vector(69 downto 0);
        decodeWriteData_i: in     vl_logic_vector(6 downto 0);
        completionWriteAddr_i: in     vl_logic_vector;
        completionWriteEn_i: in     vl_logic;
        completionWriteData_i: in     vl_logic_vector(69 downto 0);
        commitReadAddr_i: in     vl_logic_vector;
        commitReadData_o: out    vl_logic_vector(76 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROBsize : constant is 1;
    attribute mti_svvh_generic_type of addrSize : constant is 3;
end ROBregs;
