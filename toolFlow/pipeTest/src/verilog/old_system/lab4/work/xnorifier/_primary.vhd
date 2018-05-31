library verilog;
use verilog.vl_types.all;
entity xnorifier is
    port(
        outs            : out    vl_logic_vector(63 downto 0);
        ins1            : in     vl_logic_vector(63 downto 0);
        ins0            : in     vl_logic_vector(63 downto 0)
    );
end xnorifier;
