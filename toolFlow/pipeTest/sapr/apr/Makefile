link:
	make clean
	ln -s ../syn/$(DESIGN)_design/$(DESIGN).syn.v .
	ln -s ../syn/$(DESIGN)_design/$(DESIGN).sdc .

design:
	make link
	icc_shell -gui -f $(DESIGN)_apr.tcl
	rm -r $(DESIGN)_design/*
	mv $(DESIGN)_apr.v $(DESIGN)_design/$(DESIGN).apr.v
	mv $(DESIGN)_apr.sdf $(DESIGN)_design/$(DESIGN).apr.sdf
	rm -r icc_output.txt command.log $(DESIGN).spef.max legalizer_debug_plots\
		$(DESIGN).def $(DESIGN).spef.min $(DESIGN)_design.tf_checker\
		may_need_for_rotated_vias.lef

designFull:
	icc_shell -gui -f $(DESIGN)_apr.tcl	

clean:
	rm -rf *.sdc *.syn.v adrc parse* run_details XNR2D1.vdrc adrc.evx\
		*_design tcbn*

help:
	@echo "modify tcl specifically for design and run link"

