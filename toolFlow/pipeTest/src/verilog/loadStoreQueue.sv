//still missing some enable control, not yet fully functional
//full means queue is full
//flush means a load beat a store with its value, flush system
//PCout is the PC of the head of the queue (the reversion point if flush is active)
//loadOrStore is 1 bit (1 load 0 store) for new issuing instructions
//ROBin is the 5 bit ROBid for new issuing instructions
//ifNew is high if a new load/store is to be issued in queue
//addrWrite is the 64 bit address of a load/store
//addrWriteROB is the 5 bit rob tag of the load/store to have addressed added
//ifAddrWrite is high when add address
//ignore valWrite, valWriteROB, and ifValWrite for now
//LSretire is when to retire the head of the list, check for conflicts, and shift list up one

module loadStoreQueue(full, flush, PCout, loadOrStore, PCin, ROBin, ifNew, addrWrite, addrWriteROB, ifAddrWrite, valWrite, valWriteROB, , ifValWrite, LSretire, reset, clk);
	output full, flush;
	output [63:0] PCout;
	input loadOrStore, ifNew, ifAddrWrite, ifValWrite;
	input [63:0] PCin, addrWrite, valWrite;
	input [4:0] ROBin, addrWriteROB, valWriteROB;
	input LSretire, reset, clk;
	
	wire [201:0] so1, so2, so3, so4, so5, so6, so7, so8, so9, so10, so11, so12, so13, so14, so15;
	wire LS0, LS1, LS2, LS3, LS4, LS5, LS6, LS7, LS8, LS9, LS10, LS11, LS12, LS13, LS14, LS15;
	wire vpc0, mpc1, vpc2, vpc3, vpc4, vpc5, vpc6, vpc7, vpc8, vpc9, vpc10, vpc11, vpc12, vpc13, vpc14, vpc15;
	wire [63:0] pc0, pc1, pc2, pc3, pc4, pc5, pc6, pc7, pc8, pc9, pc10, pc11, pc12, pc13, pc14, pc15;
	wire vaddr0, vaddr1, vaddr2, vaddr3, vaddr4, vaddr5, vaddr6, vaddr7, vaddr8, vaddr9, vaddr10, vaddr11, vaddr12, vaddr13, vaddr14, vaddr15;
	wire [63:0] addr0, addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8, addr9, addr10, addr11, addr12, addr13, addr14, addr15;
	wire vVal0, vVal1, vVal2, vVal3, vVal4, vVal5, vVal6, vVal7, vVal8, vVal9, vVal10, vVal11, vVal12, vVal13, vVal14, vVal15;
	wire [63:0] val0, val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, val11, val12, val13, val14, val15;
	wire [4:0] rob0, rob1, rob2, rob3, rob4, rob5, rob6, rob7, rob8, rob9, rob10, rob11, rob12, rob13, rob14, rob15;
	//reg structure: LoadStore (load 1, store 0)[201], valid_PC[200], PC (64 bit)[199:135], ROBid (5 bit) [134:130], valid_addr[129], addr (64 bit)[128:65], valid_val[64], val (64 bit)[63:0]
	loadStoreRegister reg0(.out(), .newIn({LS0, vpc0, pc0, rob0}), .enNew, .addrIn({vaddr0, addr0}), .enAddr, .valIn(vVal0, val0}), .enVal);
	loadStoreRegister reg1(.out(s01), .newIn({LS1, vpc1, pc1, rob1}), .enNew, .addrIn({vaddr1, addr1}), .enAddr, .valIn(vVal1, val1}), .enVal);
	loadStoreRegister reg2(.out(s02), .newIn({LS2, vpc2, pc2, rob2}), .enNew, .addrIn({vaddr2, addr2}), .enAddr, .valIn(vVal2, val2}), .enVal);
	loadStoreRegister reg3(.out(s03), .newIn({LS3, vpc3, pc3, rob3}), .enNew, .addrIn({vaddr3, addr3}), .enAddr, .valIn(vVal3, val3}), .enVal);
	loadStoreRegister reg4(.out(s04), .newIn({LS4, vpc4, pc4, rob4}), .enNew, .addrIn({vaddr4, addr4}), .enAddr, .valIn(vVal4, val4}), .enVal);
	loadStoreRegister reg5(.out(s05), .newIn({LS5, vpc5, pc5, rob5}), .enNew, .addrIn({vaddr5, addr5}), .enAddr, .valIn(vVal5, val5}), .enVal);
	loadStoreRegister reg6(.out(s06), .newIn({LS6, vpc6, pc6, rob6}), .enNew, .addrIn({vaddr6, addr6}), .enAddr, .valIn(vVal6, val6}), .enVal);
	loadStoreRegister reg7(.out(s07), .newIn({LS7, vpc7, pc7, rob7}), .enNew, .addrIn({vaddr7, addr7}), .enAddr, .valIn(vVal7, val7}), .enVal);
	loadStoreRegister reg8(.out(s08), .newIn({LS8, vpc8, pc8, rob8}), .enNew, .addrIn({vaddr8, addr8}), .enAddr, .valIn(vVal8, val8}), .enVal);
	loadStoreRegister reg9(.out(s09), .newIn({LS9, vpc9, pc9, rob9}), .enNew, .addrIn({vaddr9, addr9}), .enAddr, .valIn(vVal9, val9}), .enVal);
	loadStoreRegister reg10(.out(s010), .newIn({LS10, vpc10, pc10, rob10}), .enNew, .addrIn({vaddr10, addr10}), .enAddr, .valIn(vVal10, val10}), .enVal);
	loadStoreRegister reg11(.out(s011), .newIn({LS11, vpc11, pc11, rob11}), .enNew, .addrIn({vaddr11, addr11}), .enAddr, .valIn(vVal11, val11}), .enVal);
	loadStoreRegister reg12(.out(so12), .newIn({LS12, vpc12, pc12, rob12}), .enNew, .addrIn({vaddr12, addr12}), .enAddr, .valIn(vVal12, val12}), .enVal);
	loadStoreRegister reg13(.out(so13), .newIn({LS13, vpc13, pc13, rob13}), .enNew, .addrIn({vaddr13, addr13}), .enAddr, .valIn(vVal13, val13}), .enVal);
	loadStoreRegister reg14(.out(so14), .newIn({LS14, vpc14, pc14, rob14}), .enNew, .addrIn({vaddr14, addr14}), .enAddr, .valIn(vVal14, val14}), .enVal);
	loadStoreRegister reg15(.out(so15), .newIn({LS15, vpc15, pc15, rob15}), .enNew, .addrIn({vaddr15, addr15}), .enAddr, .valIn(vVal15, val15}), .enVal);
	
		
	//enable control
	wire enNew0, enNew1, enNew2, enNew3, enNew4, enNew5, enNew6, enNew7, enNew8, enNew9, enNew10, enNew11, enNew12, enNew13, enNew14, enNew15;
	wire enAddr0, enAddr1, enAddr2, enAddr3, enAddr4, enAddr5, enAddr6, enAddr7, enAddr8, enAddr9, enAddr10, enAddr11, enAddr12, enAddr13, enAddr14, enAddr15;
	wire enVal0, enVal1, enVal2, enVal3, enVal4, enVal5, enVal6, enVal7, enVal8, enVal9, enVal10, enVal11, enVal12, enVal13, enVal14, enVal15;
	always_comb begin
		en0 = LSretire|(jVal[0]&ifNew);
	end
	
	//shift muxes
	wire [15:0] jVal;
	assign jVal[15] = (tailAddr==4'hF);	assign jVal[14] = (tailAddr==4'hE);	assign jVal[13] = (tailAddr==4'hD);	assign jVal[12] = (tailAddr==4'hC);
	assign jVal[11] = (tailAddr==4'hB);	assign jVal[10] = (tailAddr==4'hA)	assign jVal[9] = (tailADDR==4'h9);	assign jVal[8] = (tailAddr==4'h8);
	assign jVal[7] = (tailAddr==4'h7);	assign jVal[6] = (tailAddr==4'h6);	assign jVal[5] = (tailAddr==4'h5);	assign jVal[4] = (tailAddr==4'h4);
	assign jVal[3] = (tailAddr==4'h3);	assign jVal[2] = (tailAddr==4'h1);	assign jVal[1] = (tailAddr==4'h1);	assign jVal[0] = (tailAddr==4'h0);
	//wire mLS0, mLS1, mLS2, mLS3, mLS4, mLS5, mLS6, mLS7, mLS8, mLS9, mLS10, mLS11, mLS12, mLS13, mLS14;
	wire [63:0] mpc0, mpc1, mpc2, mpc3, mpc4, mpc5, mpc6, mpc7, mpc8, mpc9, mpc10, mpc11, mpc12, mpc13, mpc14
	//wire mvaddr0, mvaddr1, mvaddr2, mvaddr3, mvaddr4, mvaddr5, mvaddr6, mvaddr7, mvaddr8, mvaddr9, mvaddr10, mvaddr11, mvaddr12, mvaddr13, mvaddr14, mvaddr15;
	wire [63:0] maddr0, maddr1, maddr2, maddr3, maddr4, maddr5, maddr6, maddr7, maddr8, maddr9, maddr10, maddr11, maddr12, maddr13, maddr14;
	//wire mvVal0, mvVal1, mvVal2, mvVal3, mvVal4, mvVal5, mvVal6, mvVal7, mvVal8, mvVal9, mvVal10, mvVal11, mvVal12, mvVal13, mvVal14, mvVal15;
	wire [63:0] mval0, mval1, mval2, mval3, mval4, mval5, mval6, mval7, mval8, mval9, mval10, mval11, mval12, mval13, mval14;
	wire [4:0] mrob0, mrob1, mrob2, mrob3, mrob4, mrob5, mrob6, mrob7, mrob8, mrob9, mrob10, mrob11, mrob12, mrob13, mrob14;
	wire [15:0] 
	
	always_comb begin
		LS0 = jVal[0]?loadOrStore:so1[201];	LS1 = jVal[1]?loadOrStore:so2[201];	LS2 = jVal[2]?loadOrStore:so3[201];	LS3 = jVal[3]?loadOrStore:so4[201];
		LS4 = jVal[4]?loadOrStore:so5[201];	LS5 = jVal[5]?loadOrStore:so6[201];	LS6 = jVal[6]?loadOrStore:so7[201];	LS7 = jVal[7]?loadOrStore:so8[201];
		LS8 = jVal[8]?loadOrStore:so9[201];	LS9 = jVal[9]?loadOrStore:so10[201];	LS10 = jVal[10]?loadOrStore:so11[201];	LS11 = jVal[11]?loadOrStore:so12[201];
		LS12 = jVal[12]?loadOrStore:so13[201];	LS13 = jVal[13]?loadOrStore:so14[201];	LS14 = jVal[14]?loadOrStore:so15[201];	LS15 = loadOrStore;
		
		vpc0 = so1[200]|(jVal[0]&ifNew);	vpc1 = so2[200]|(jVal[1]&ifNew);	vpc2 = so3[200]|(jVal[2]&ifNew);	vpc3 = so4[200]|(jVal[3]&ifNew);
		vpc4 = so5[200]|(jVal[4]&ifNew);	vpc5 = so6[200]|(jVal[5]&ifNew);	vpc6 = so7[200]|(jVal[6]&ifNew);	vpc7 = so8[200]|(jVal[7]&ifNew);
		vpc8 = so9[200]|(jVal[8]&ifNew);	vpc9 = so10[200]|(jVal[9]&ifNew);	vpc10 = so11[200]|(jVal[10]&ifNew);	vpc11 = so12[200]|(jVal[11]&ifNew);
		vpc12 = so13[200]|(jVal[12]&ifNew);	vpc13 = so14[200]|(jVal[13]&ifNew);	vpc14 = so15[200]|(jVal[14]&ifNew);	vpc15 = jVal[15]&ifNew;
		
		pc0 = jVal[0]?PCin:so1[197:133];	pc1 = jVal[1]?PCin:so2[197:133];	pc2 = jVal[2]?PCin:so3[197:133];	pc3 = jVal[3]?PCin:so4[197:133];
		pc4 = jVal[4]?PCin:so5[197:133];	pc5 = jVal[5]?PCin:so6[197:133];	pc6 = jVal[6]?PCin:so7[197:133];	pc7 = jVal[7]?PCin:so8[197:133];
		pc8 = jVal[8]?PCin:so9[197:133];	pc9 = jVal[9]?PCin:so10[197:133];	pc10 = jVal[10]?PCin:so11[197:133];	pc11 = jVal[11]?PCin:so12[197:133];
		pc12 = jVal[12]?PCin:so13[197:133];	pc13 = jVal[13]?PCin:so14[197:133];	pc14 = jVal[14]?PCin:so15[197:133];	pc15 = PCin;
		
		rob0 = jVal[0]?ROBin:so1[4:0];		rob1 = jVal[1]?ROBin:so2[4:0];		rob2 = jVal[2]?ROBin:so3[4:0];		rob3 = jVal[3]?ROBin:so4[4:0];
		rob4 = jVal[4]?ROBin:so5[4:0];		rob5 = jVal[5]?ROBin:so6[4:0];		rob6 = jVal[6]?ROBin:so7[4:0];		rob7 = jVal[7]?ROBin:so8[4:0];
		rob8 = jVal[8]?ROBin:so9[4:0];		rob9 = jVal[9]?ROBin:so10[4:0];		rob10 = jVal[10]?ROBin:so11[4:0];	rob11 = jVal[11]?ROBin:so12[4:0];
		rob12 = jVal[12]?ROBin:so13[4:0];	rob13 = jVal[13]?ROBin:so14[4:0];	rob14 = jVal[14]?ROBin:so15[4:0];	rob15 = ROBin;
		
		vaddr0 = so1[134]|maddr0;		vaddr1 = so2[134]|maddr1;		vaddr2 = so3[134]|maddr2;		vaddr3 = so4[134]|maddr3;
		vaddr4 = so5[134]|maddr4;		vaddr5 = so6[134]|maddr5;		vaddr6 = so7[134]|maddr6;		vaddr7 = so8[134]|maddr7;
		vaddr8 = so9[134]|maddr8;		vaddr9 = so10[134]|maddr9;		vaddr10 = so11[134]|maddr10;		vaddr11 = so12[134]|maddr11;
		vaddr12 = so13[134]|maddr12;		vaddr13 = so14[134]|maddr13;		vaddr14 = so15[134]|maddr14;		vaddr15 = maddr15;
		
		addr0 = maddr0?addrWrite:so1[132:69];	addr1 = maddr1?addrWrite:so2[132:69];	addr2 = maddr2?addrWrite:so3[132:69];	addr3 = maddr3?addrWrite:so4[132:69];
		addr4 = maddr4?addrWrite:so5[132:69];	addr5 = maddr5?addrWrite:so6[132:69];	addr6 = maddr6?addrWrite:so7[132:69];	addr7 = maddr7?addrWrite:so8[132:69];
		addr8 = maddr8?addrWrite:so9[132:69];	addr9 = maddr9?addrWrite:so10[132:69];	addr10 = maddr10?addrWrite:so11[132:69];addr11 = maddr11?addrWrite:so12[132:69];
		addr12 = maddr12?addrWrite:so13[132:69];addr13 = maddr13?addrWrite:so14[132:69];addr14 = maddr14?addrWrite:so15[132:69];addr15 = addrWrite;
		
		vVal0 = so1[69]|mval0;			vVal1 = so2[69]|mval1;			vVal2 = so3[69]|mval2;			vVal3 = so4[69]|mval3;
		vVal4 = so5[69]|mval4;			vVal5 = so6[69]|mval5;			vVal6 = so7[69]|mval6;			vVal7 = so8[69]|mval7;
		vVal8 = so9[69]|mval8;			vVal9 = so10[69]|mval9;			vVal10 = so11[69]|mval10;		vVal11 = so12[69]|mval11;
		vVal12 = so13[69]|mval12;		vVal13 = so14[69]|mval13;		vVal14 = so15[69]|mval14;		vVal15 = mval15;
		
		val0 = mval0?valWrite:so1[68:5];	val1 = mval1?valWrite:so2[68:5];	val2 = mval2?valWrite:so3[68:5];	val3 = mval3?valWrite:so4[68:5];
		val4 = mval4?valWrite:so5[68:5];	val5 = mval5?valWrite:so6[68:5];	val6 = mval6?valWrite:so7[68:5];	val7 = mval7?valWrite:so8[68:5];
		val8 = mval8?valWrite:so9[68:5];	val9 = mval9?valWrite:so10[68:5];	val10 = mval10?valWrite:so11[68:5];	val11 = mval11?valWrite:so12[68:5];
		val12 = mval12?valWrite:so13[68:5];	val13 = mval13?valWrite:so14[68:5];	val14 = mval14?valWrite:so15[68:5];	val15 = valWrite;
	end
	
	//mux control search ROB tags
	wire aXor0, aXor1, aXor2, aXor3, aXor4, aXor5, aXor6, aXor7, aXor8, aXor9, aXor10, aXor11, aXor12, aXor13, aXor14, aXor15;
	wire lXor0, lXor1, lXor2, lXor3, lXor4, lXor5, lXor6, lXor7, lXor8, lXor9, lXor10, lXor11, lXor12, lXor13, lXor14, lXor15;
	always_comb begin
		aXor0 = addWriteROB^so0[4:0];		aXor1 = addWriteROB^so1[4:0];		aXor2 = addWriteROB^so2[4:0];		aXor3 = addWriteROB^so3[4:0];
		aXor4 = addWriteROB^so4[4:0];		aXor5 = addWriteROB^so5[4:0];		aXor6 = addWriteROB^so6[4:0];		aXor7 = addWriteROB^so7[4:0];
		aXor8 = addWriteROB^so8[4:0];		aXor9 = addWriteROB^so9[4:0];		aXor10 = addWriteROB^so10[4:0];		aXor11 = addWriteROB^so11[4:0];
		aXor12 = addWriteROB^so12[4:0];		aXor13 = addWriteROB^so13[4:0];		aXor14 = addWriteROB^so14[4:0];		aXor15 = addWriteROB^so15[4:0];
		maddr0 = (~|aXor0)&ifAddrWrite;		maddr1 = (~|aXor1)&ifAddrWrite;		maddr2 = (~|aXor2)&ifAddrWrite;		maddr3 = (~|aXor3)&ifAddrWrite;
		maddr4 = (~|aXor4)&ifAddrWrite;		maddr5 = (~|aXor5)&ifAddrWrite;		maddr6 = (~|aXor6)&ifAddrWrite;		maddr7 = (~|aXor7)&ifAddrWrite;
		maddr8 = (~|aXor8)&ifAddrWrite;		maddr9 = (~|aXor9)&ifAddrWrite;		maddr10 = (~|aXor10)&ifAddrWrite;	maddr11 = (~|aXor11)&ifAddrWrite;
		maddr12 = (~|aXor12)&ifAddrWrite;	maddr13 = (~|aXor13)&ifAddrWrite;	maddr14 = (~|aXor14)&ifAddrWrite;	maddr15 = (~|aXor15)&ifAddrWrite;
		
		lXor0 = valWriteROB^so0[4:0];		lXor1 = valWriteROB^so1[4:0];		lXor2 = valWriteROB^so2[4:0];		lXor3 = valWriteROB^so3[4:0];
		lXor4 = valWriteROB^so4[4:0];		lXor5 = valWriteROB^so5[4:0];		lXor6 = valWriteROB^so6[4:0];		lXor7 = valWriteROB^so7[4:0];
		lXor8 = valWriteROB^so8[4:0];		lXor9 = valWriteROB^so9[4:0];		lXor10 = valWriteROB^so10[4:0];		lXor11 = valWriteROB^so11[4:0];
		lXor12 = valWriteROB^so12[4:0];		lXor13 = valWriteROB^so13[4:0];		lXor14 = valWriteROB^so14[4:0];		lXor15 = valWriteROB^so15[4:0];
		mval0 = (~|lXor0)&ifValWrite;		mval1 = (~|lXor1)&ifValWrite;		mval2 = (~|lXor2)&ifValWrite;		mval3 = (~|lXor3)&ifValWrite;
		mval4 = (~|lXor4)&ifValWrite;		mval5 = (~|lXor5)&ifValWrite;		mval6 = (~|lXor6)&ifValWrite;		mval7 = (~|lXor7)&ifValWrite;
		mval8 = (~|lXor8)&ifValWrite;		mval9 = (~|lXor9)&ifValWrite;		mval10 = (~|lXor10)&ifValWrite;		mval11 = (~|lXor11)&ifValWrite;
		mval12 = (~|lXor12)&ifValWrite;		mval13 = (~|lXor13)&ifValWrite;		mval14 = (~|lXor14)&ifValWrite;		mval15 = (~|lXor15)&ifValWrite;
	end
	
	//counter for tail
	reg [3:0] tailAddr;
	always_ff @(posedge clk) begin
		if (reset | tailAddr==4'h0)
			tailAddr <= 4'h0;
		if (tailAddr==4'hF)
			tailAddr <= 4'hF;
		else if (ifNew & LSretire)
			tailAddr <= tailAddr;
		else if (ifNew)
			tailAddr <= tailAddr+1;
		else if (LSretire)
			tailAddr <= tailAddr-1;
	end
	assign full = &tailAddr; //full when tail above queue
	
	
	
	// functions
		//when to shift and downcount at retire
	
endmodule

