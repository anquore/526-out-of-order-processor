
.PHONY: clean top


TESTNAME=default_test
SDF_ANNOTATE := 0
EXTERNAL_DATA:= 1
DEBUG := 1
SIM := 1
BEHAV:=1

VERILOG_DEFINES := 
ifeq ($(SDF_ANNOTATE), 1)
	VERILOG_DEFINES := $(VERILOG_DEFINES)+SDF_ANNOTATE=1
endif
ifeq ($(SIM), 1)
	VERILOG_DEFINES := $(VERILOG_DEFINES)+SIM=1
endif
ifeq ($(EXTERNAL_DATA), 1)
	VERILOG_DEFINES := $(VERILOG_DEFINES)+EXTERNAL_DATA=1
endif
ifeq ($(DEBUG), 1)
	VERILOG_DEFINES := $(VERILOG_DEFINES)+DEBUG=1
endif
ifeq ($(BEHAV), 1)
	VERILOG_DEFINES := $(VERILOG_DEFINES)+BEHAV=1
endif


design:
	make clean
	vcs -f $(DESIGN).include \
	+v2k -debug_pp +lint=IRIMW,NCEID,GCWM,IGSFPG,TFIPC,IPDP,PCWM -sverilog -full64\
		+plusarg_save -timescale=1ns/10ps -l $(DESIGN).log \
	+testname=$(TESTNAME) \
		+define$(VERILOG_DEFINES) 
	simv +vpdfile+$(DESIGN).vpd


clean:
	-rm -rf simv.daidir\
			  *.log\
			  *~\
			  csrc\
			  ucli.key\
			  simv\
			  DVEfiles\
			  dve_report*\
			  *.vpd\
			  *.vcd

help:
	@echo "place include file with paths back to src/verilog"
