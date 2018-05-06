design:
	make clean
	ln -s ../../src/verilog/$(DESIGN).v .
	dc_shell -f $(DESIGN)_syn.tcl
	rm $(DESIGN)_design/*
	mv netlist/$(DESIGN).v $(DESIGN)_design/$(DESIGN).syn.v
	mv reports/$(DESIGN).sdf $(DESIGN)_design/$(DESIGN).syn.sdf
	mv reports/$(DESIGN).sdc $(DESIGN)_design/.
	rm -r alib-52 db command.log ddc default.svf netlist

designFull:
	dc_shell -f $(DESIGN)_syn.tcl

clean:
	rm -rf alib-52 db command.log ddc reports default.svf *_design netlist *.vged

help:
	@echo "edit the tcl file to be specific to your project"

