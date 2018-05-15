design:
	make link
	vcs -f $(DESIGN).include +v2k +lint -sverilog -full64 -debug_pp -timescale=1ns/10ps\
		-l $(DESIGN).log 
	./simv

link:
	make clean
	ln -s ../../sapr/syn/$(DESIGN)_design/$(DESIGN).syn.v .
	ln -s ../../sapr/syn/$(DESIGN)_design/$(DESIGN).syn.sdf .
	ln -s ../../src/verilog/tb.syn.v tb.v

clean:
	rm -rf simv.daidir csrc fsm.log fsm.vcd* vcdplus.vpd *.syn.v\
		*.syn.sdf tb.v simv ucli.key *.log DVEfiles

help:
	@echo "add line \$$sdf_annotate(\"./fsm.syn.sdf\", fsm0); to copy of test bench"

