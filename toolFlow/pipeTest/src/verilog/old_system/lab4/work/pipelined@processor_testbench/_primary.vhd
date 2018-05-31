library verilog;
use verilog.vl_types.all;
entity pipelinedProcessor_testbench is
    generic(
        ClockDelay      : integer := 2000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end pipelinedProcessor_testbench;
