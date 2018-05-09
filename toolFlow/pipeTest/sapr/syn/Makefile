design:
	make clean
	#cat `grep '^[^#]' ../../src/verilog/$(DESIGN).include` > .tempConcat.sv
	dc_shell -f $(DESIGN)_syn.tcl
	rm -f $(DESIGN)_design/*
	rm -f .tempConcat.sv
	mv netlist/$(DESIGN).v $(DESIGN)_design/$(DESIGN).syn.v
	mv reports/$(DESIGN).sdf $(DESIGN)_design/$(DESIGN).syn.sdf
	mv reports/$(DESIGN).sdc $(DESIGN)_design/.
	rm -rf alib-52 db command.log ddc default.svf netlist

designFull:
	dc_shell -f $(DESIGN)_syn.tcl

clean:
	rm -rf alib-52 db *.log ddc reports default.svf *_design netlist *.sv

help:
	@echo "edit the tcl file to be specific to your project"

