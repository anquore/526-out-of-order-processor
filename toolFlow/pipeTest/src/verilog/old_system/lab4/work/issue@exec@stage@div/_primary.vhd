library verilog;
use verilog.vl_types.all;
entity issueExecStageDiv is
    generic(
        ROBsize         : integer := 32;
        ROBsizeLog      : vl_notype
    );
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        stallRS_o       : out    vl_logic;
        reservationStationVal1_i: in     vl_logic_vector(63 downto 0);
        reservationStationVal2_i: in     vl_logic_vector(63 downto 0);
        reservationStationCommands_i: in     vl_logic_vector(9 downto 0);
        reservationStationTag_i: in     vl_logic_vector;
        readyRS_i       : in     vl_logic;
        canGo_i         : in     vl_logic;
        executeTag_o    : out    vl_logic_vector;
        executeCommands_o: out    vl_logic_vector(9 downto 0);
        executeVal_o    : out    vl_logic_vector(63 downto 0);
        valid_o         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROBsize : constant is 1;
    attribute mti_svvh_generic_type of ROBsizeLog : constant is 3;
end issueExecStageDiv;
