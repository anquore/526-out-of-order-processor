design:
	make link
	vcs -f $(DESIGN).include +v2k +lint -sverilog -full64 -debug_pp -timescale=1ns/10ps\
		-l $(DESIGN).log 
	./simv

link:
	make clean
	ln -s ../../sapr/apr/$(DESIGN)_design/$(DESIGN).apr.v .
	ln -s ../../sapr/apr/$(DESIGN)_design/$(DESIGN).apr.sdf .
	ln -s ../../src/verilog/tb.apr.v tb.v

clean:
	rm -rf simv.daidir csrc *.log *.vcd* vcdplus.vpd simv tb.v ucli.key *.apr.sdf *.apr.v

help:
	@echo "add line \$$sdf_annotate(\"./fsm.apr.sdf\", fsm0); to copy of test bench"

