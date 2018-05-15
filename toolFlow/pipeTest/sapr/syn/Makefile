design:
	make clean
	dc_shell -f $(DESIGN)_syn.tcl
	rm -f $(DESIGN)_design/*
	mv netlist/$(DESIGN).v $(DESIGN)_design/$(DESIGN).syn.v
	mv reports/$(DESIGN).sdf $(DESIGN)_design/$(DESIGN).syn.sdf
	mv reports/$(DESIGN).sdc $(DESIGN)_design/.
	mkdir .tempDirDel
	mv * .tempDirDel/.
	mv .tempDirDel/Makefile .
	mv .tempDirDel/*.tcl .
	mv .tempDirDel/$(DESIGN)_design .
	rm -rf .tempDirDel

designFull:
	dc_shell -f $(DESIGN)_syn.tcl

clean:
	rm -rf .tempDirDel
	mkdir .tempDirDel
	mv * .tempDirDel/.
	mv .tempDirDel/Makefile .
	mv .tempDirDel/*.tcl .
	rm -rf .tempDirDel

help:
	@echo "edit the tcl file to be specific to your project"

