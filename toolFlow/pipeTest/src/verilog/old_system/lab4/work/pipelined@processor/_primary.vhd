library verilog;
use verilog.vl_types.all;
entity pipelinedProcessor is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end pipelinedProcessor;
