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

module loadStoreQueue(full, flush, PCout, loadOrStore, PCin, ROBin, ifNew, addrWrite, addrWriteROB, ifAddrWrite, valWrite, valWriteROB, ifValWrite, LSretire, reset, clk);
	output logic full, flush;
	output logic [63:0] PCout;
	input logic loadOrStore, ifNew, ifAddrWrite, ifValWrite;
	input logic [63:0] PCin, addrWrite, valWrite;
	input logic [4:0] ROBin, addrWriteROB, valWriteROB;
	input logic LSretire, reset, clk;
	
	logic [201:0] so0, so1, so2, so3, so4, so5, so6, so7, so8, so9, so10, so11, so12, so13, so14, so15;
	logic LS0, LS1, LS2, LS3, LS4, LS5, LS6, LS7, LS8, LS9, LS10, LS11, LS12, LS13, LS14, LS15;
	logic vpc0, vpc1, vpc2, vpc3, vpc4, vpc5, vpc6, vpc7, vpc8, vpc9, vpc10, vpc11, vpc12, vpc13, vpc14, vpc15;
	logic [63:0] pc0, pc1, pc2, pc3, pc4, pc5, pc6, pc7, pc8, pc9, pc10, pc11, pc12, pc13, pc14, pc15;
	logic vaddr0, vaddr1, vaddr2, vaddr3, vaddr4, vaddr5, vaddr6, vaddr7, vaddr8, vaddr9, vaddr10, vaddr11, vaddr12, vaddr13, vaddr14, vaddr15;
	logic [63:0] addr0, addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8, addr9, addr10, addr11, addr12, addr13, addr14, addr15;
	logic vVal0, vVal1, vVal2, vVal3, vVal4, vVal5, vVal6, vVal7, vVal8, vVal9, vVal10, vVal11, vVal12, vVal13, vVal14, vVal15;
	logic [63:0] val0, val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, val11, val12, val13, val14, val15;
	logic [4:0] rob0, rob1, rob2, rob3, rob4, rob5, rob6, rob7, rob8, rob9, rob10, rob11, rob12, rob13, rob14, rob15;
 //enable control
	logic enNew0, enNew1, enNew2, enNew3, enNew4, enNew5, enNew6, enNew7, enNew8, enNew9, enNew10, enNew11, enNew12, enNew13, enNew14, enNew15;
	logic enAddr0, enAddr1, enAddr2, enAddr3, enAddr4, enAddr5, enAddr6, enAddr7, enAddr8, enAddr9, enAddr10, enAddr11, enAddr12, enAddr13, enAddr14, enAddr15;
	logic enVal0, enVal1, enVal2, enVal3, enVal4, enVal5, enVal6, enVal7, enVal8, enVal9, enVal10, enVal11, enVal12, enVal13, enVal14, enVal15;
  logic [15:0] jVal;
  logic maddr0, maddr1, maddr2, maddr3, maddr4, maddr5, maddr6, maddr7, maddr8, maddr9, maddr10, maddr11, maddr12, maddr13, maddr14, maddr15;
	//logic mvVal0, mvVal1, mvVal2, mvVal3, mvVal4, mvVal5, mvVal6, mvVal7, mvVal8, mvVal9, mvVal10, mvVal11, mvVal12, mvVal13, mvVal14, mvVal15;
	logic mval0, mval1, mval2, mval3, mval4, mval5, mval6, mval7, mval8, mval9, mval10, mval11, mval12, mval13, mval14, mval15;
  logic [3:0] tailAddr;
	//reg structure: LoadStore (load 1, store 0)[200], valid_PC[199], PC (64 bit)[198:135], ROBid (5 bit) [134:130], valid_addr[129], addr (64 bit)[128:65], valid_val[64], val (64 bit)[63:0]
	loadStoreRegister reg0(.out(so0), .newIn({LS0, vpc0, pc0, rob0}), .enNew(enNew0), .addrIn({vaddr0, addr0}), .enAddr(enAddr0), .valIn({vVal0, val0}), .enVal(enVal0), .reset, .clk);
	loadStoreRegister reg1(.out(so1), .newIn({LS1, vpc1, pc1, rob1}), .enNew(enNew1), .addrIn({vaddr1, addr1}), .enAddr(enAddr1), .valIn({vVal1, val1}), .enVal(enVal1), .reset, .clk);
	loadStoreRegister reg2(.out(so2), .newIn({LS2, vpc2, pc2, rob2}), .enNew(enNew2), .addrIn({vaddr2, addr2}), .enAddr(enAddr2), .valIn({vVal2, val2}), .enVal(enVal2), .reset, .clk);
	loadStoreRegister reg3(.out(so3), .newIn({LS3, vpc3, pc3, rob3}), .enNew(enNew3), .addrIn({vaddr3, addr3}), .enAddr(enAddr3), .valIn({vVal3, val3}), .enVal(enVal3), .reset, .clk);
	loadStoreRegister reg4(.out(so4), .newIn({LS4, vpc4, pc4, rob4}), .enNew(enNew4), .addrIn({vaddr4, addr4}), .enAddr(enAddr4), .valIn({vVal4, val4}), .enVal(enVal4), .reset, .clk);
	loadStoreRegister reg5(.out(so5), .newIn({LS5, vpc5, pc5, rob5}), .enNew(enNew5), .addrIn({vaddr5, addr5}), .enAddr(enAddr5), .valIn({vVal5, val5}), .enVal(enVal5), .reset, .clk);
	loadStoreRegister reg6(.out(so6), .newIn({LS6, vpc6, pc6, rob6}), .enNew(enNew6), .addrIn({vaddr6, addr6}), .enAddr(enAddr6), .valIn({vVal6, val6}), .enVal(enVal6), .reset, .clk);
	loadStoreRegister reg7(.out(so7), .newIn({LS7, vpc7, pc7, rob7}), .enNew(enNew7), .addrIn({vaddr7, addr7}), .enAddr(enAddr7), .valIn({vVal7, val7}), .enVal(enVal7), .reset, .clk);
	loadStoreRegister reg8(.out(so8), .newIn({LS8, vpc8, pc8, rob8}), .enNew(enNew8), .addrIn({vaddr8, addr8}), .enAddr(enAddr8), .valIn({vVal8, val8}), .enVal(enVal8), .reset, .clk);
	loadStoreRegister reg9(.out(so9), .newIn({LS9, vpc9, pc9, rob9}), .enNew(enNew9), .addrIn({vaddr9, addr9}), .enAddr(enAddr9), .valIn({vVal9, val9}), .enVal(enVal9), .reset, .clk);
	loadStoreRegister reg10(.out(so10), .newIn({LS10, vpc10, pc10, rob10}), .enNew(enNew10), .addrIn({vaddr10, addr10}), .enAddr(enAddr10), .valIn({vVal10, val10}), .enVal(enVal10), .reset, .clk);
	loadStoreRegister reg11(.out(so11), .newIn({LS11, vpc11, pc11, rob11}), .enNew(enNew11), .addrIn({vaddr11, addr11}), .enAddr(enAddr11), .valIn({vVal11, val11}), .enVal(enVal11), .reset, .clk);
	loadStoreRegister reg12(.out(so12), .newIn({LS12, vpc12, pc12, rob12}), .enNew(enNew12), .addrIn({vaddr12, addr12}), .enAddr(enAddr12), .valIn({vVal12, val12}), .enVal(enVal12), .reset, .clk);
	loadStoreRegister reg13(.out(so13), .newIn({LS13, vpc13, pc13, rob13}), .enNew(enNew13), .addrIn({vaddr13, addr13}), .enAddr(enAddr13), .valIn({vVal13, val13}), .enVal(enVal13), .reset, .clk);
	loadStoreRegister reg14(.out(so14), .newIn({LS14, vpc14, pc14, rob14}), .enNew(enNew14), .addrIn({vaddr14, addr14}), .enAddr(enAddr14), .valIn({vVal14, val14}), .enVal(enVal14), .reset, .clk);
	loadStoreRegister reg15(.out(so15), .newIn({LS15, vpc15, pc15, rob15}), .enNew(enNew15), .addrIn({vaddr15, addr15}), .enAddr(enAddr15), .valIn({vVal15, val15}), .enVal(enVal15), .reset, .clk);
	
	//retirment checker
	logic adcmp1, adcmp2, adcmp3, adcmp4, adcmp5, adcmp6, adcmp7, adcmp8, adcmp9, adcmp10, adcmp11, adcmp12, adcmp13, adcmp14, adcmp15;
	always_comb begin
		adcmp1 = (~|(so0[128:65]^so1[128:56]))&so1[201]&so1[129];		adcmp2 = (~|(so0[128:65]^so2[128:56]))&so2[201]&so2[129];
		adcmp3 = (~|(so0[128:65]^so3[128:56]))&so3[201]&so3[129];		adcmp4 = (~|(so0[128:65]^so4[128:56]))&so4[201]&so4[129];
		adcmp5 = (~|(so0[128:65]^so5[128:56]))&so5[201]&so5[129];		adcmp6 = (~|(so0[128:65]^so6[128:56]))&so6[201]&so6[129];
		adcmp7 = (~|(so0[128:65]^so7[128:56]))&so7[201]&so7[129];		adcmp8 = (~|(so0[128:65]^so8[128:56]))&so8[201]&so8[129];
		adcmp9 = (~|(so0[128:65]^so9[128:56]))&so9[201]&so9[129];		adcmp10 = (~|(so0[128:65]^so10[128:56]))&so10[201]&so10[129];
		adcmp11 = (~|(so0[128:65]^so11[128:56]))&so11[201]&so11[129];		adcmp12 = (~|(so0[128:65]^so12[128:56]))&so12[201]&so12[129];
		adcmp13 = (~|(so0[128:65]^so13[128:56]))&so13[201]&so13[129];		adcmp14 = (~|(so0[128:65]^so14[128:56]))&so14[201]&so14[129];
		adcmp15 = (~|(so0[128:65]^so15[128:56]))&so15[201]&so15[129];
	end
	assign flush = (adcmp1|adcmp2|adcmp3|adcmp4|adcmp5|adcmp6|adcmp7|adcmp8|adcmp9|adcmp10|adcmp11|adcmp12|adcmp13|adcmp14|adcmp15)&~so0[201];
		

	always_comb begin
		enNew0 = LSretire|(jVal[0]&ifNew);	enNew1 = LSretire|(jVal[1]&ifNew);	enNew2 = LSretire|(jVal[2]&ifNew);	enNew3 = LSretire|(jVal[3]&ifNew);
		enNew4 = LSretire|(jVal[4]&ifNew);	enNew5 = LSretire|(jVal[5]&ifNew);	enNew6 = LSretire|(jVal[6]&ifNew);	enNew7 = LSretire|(jVal[7]&ifNew);
		enNew8 = LSretire|(jVal[8]&ifNew);	enNew9 = LSretire|(jVal[9]&ifNew);	enNew10 = LSretire|(jVal[10]&ifNew);	enNew11 = LSretire|(jVal[11]&ifNew);
		enNew12 = LSretire|(jVal[12]&ifNew);	enNew13 = LSretire|(jVal[13]&ifNew);	enNew14 = LSretire|(jVal[14]&ifNew);	enNew15 = LSretire|(jVal[15]&ifNew);
		
		enAddr0 = LSretire|(maddr0&ifAddrWrite);	enAddr1 = LSretire|(maddr1&ifAddrWrite);	enAddr2 = LSretire|(maddr2&ifAddrWrite);	enAddr3 = LSretire|(maddr3&ifAddrWrite);
		enAddr4 = LSretire|(maddr4&ifAddrWrite);	enAddr5 = LSretire|(maddr5&ifAddrWrite);	enAddr6 = LSretire|(maddr6&ifAddrWrite);	enAddr7 = LSretire|(maddr7&ifAddrWrite);
		enAddr8 = LSretire|(maddr8&ifAddrWrite);	enAddr9 = LSretire|(maddr9&ifAddrWrite);	enAddr10 = LSretire|(maddr10&ifAddrWrite);	enAddr11 = LSretire|(maddr11&ifAddrWrite);
		enAddr12 = LSretire|(maddr12&ifAddrWrite);	enAddr13 = LSretire|(maddr13&ifAddrWrite);	enAddr14 = LSretire|(maddr14&ifAddrWrite);	enAddr15 = LSretire|(maddr15&ifAddrWrite);
		
		enVal0 = LSretire|(mval0&ifValWrite);	enVal1 = LSretire|(mval1&ifValWrite);	enVal2 = LSretire|(mval2&ifValWrite);	enVal3 = LSretire|(mval3&ifValWrite);
		enVal4 = LSretire|(mval4&ifValWrite);	enVal5 = LSretire|(mval5&ifValWrite);	enVal6 = LSretire|(mval6&ifValWrite);	enVal7 = LSretire|(mval7&ifValWrite);
		enVal8 = LSretire|(mval8&ifValWrite);	enVal9 = LSretire|(mval9&ifValWrite);	enVal10 = LSretire|(mval10&ifValWrite);	enVal11 = LSretire|(mval11&ifValWrite);
		enVal12 = LSretire|(mval12&ifValWrite);	enVal3 = LSretire|(mval13&ifValWrite);	enVal14 = LSretire|(mval14&ifValWrite);	enVal15 = LSretire|(mval15&ifValWrite);
	end
	
	//shift muxes
	assign jVal[15] = (tailAddr==4'hF);	assign jVal[14] = (tailAddr==4'hE);	assign jVal[13] = (tailAddr==4'hD);	assign jVal[12] = (tailAddr==4'hC);
	assign jVal[11] = (tailAddr==4'hB);	assign jVal[10] = (tailAddr==4'hA);	assign jVal[9] = (tailAddr==4'h9);	assign jVal[8] = (tailAddr==4'h8);
	assign jVal[7] = (tailAddr==4'h7);	assign jVal[6] = (tailAddr==4'h6);	assign jVal[5] = (tailAddr==4'h5);	assign jVal[4] = (tailAddr==4'h4);
	assign jVal[3] = (tailAddr==4'h3);	assign jVal[2] = (tailAddr==4'h1);	assign jVal[1] = (tailAddr==4'h1);	assign jVal[0] = (tailAddr==4'h0);
	//logic mLS0, mLS1, mLS2, mLS3, mLS4, mLS5, mLS6, mLS7, mLS8, mLS9, mLS10, mLS11, mLS12, mLS13, mLS14;
	//logic mvaddr0, mvaddr1, mvaddr2, mvaddr3, mvaddr4, mvaddr5, mvaddr6, mvaddr7, mvaddr8, mvaddr9, mvaddr10, mvaddr11, mvaddr12, mvaddr13, mvaddr14, mvaddr15;
	
	
	always_comb begin
		LS0 = jVal[0]?loadOrStore:so1[200];	LS1 = jVal[1]?loadOrStore:so2[200];	LS2 = jVal[2]?loadOrStore:so3[200];	LS3 = jVal[3]?loadOrStore:so4[200];
		LS4 = jVal[4]?loadOrStore:so5[200];	LS5 = jVal[5]?loadOrStore:so6[200];	LS6 = jVal[6]?loadOrStore:so7[200];	LS7 = jVal[7]?loadOrStore:so8[200];
		LS8 = jVal[8]?loadOrStore:so9[200];	LS9 = jVal[9]?loadOrStore:so10[200];	LS10 = jVal[10]?loadOrStore:so11[200];	LS11 = jVal[11]?loadOrStore:so12[200];
		LS12 = jVal[12]?loadOrStore:so13[200];	LS13 = jVal[13]?loadOrStore:so14[200];	LS14 = jVal[14]?loadOrStore:so15[200];	LS15 = loadOrStore;
		
		vpc0 = so1[199]|(jVal[0]&ifNew);	vpc1 = so2[199]|(jVal[1]&ifNew);	vpc2 = so3[199]|(jVal[2]&ifNew);	vpc3 = so4[199]|(jVal[3]&ifNew);
		vpc4 = so5[199]|(jVal[4]&ifNew);	vpc5 = so6[199]|(jVal[5]&ifNew);	vpc6 = so7[199]|(jVal[6]&ifNew);	vpc7 = so8[199]|(jVal[7]&ifNew);
		vpc8 = so9[199]|(jVal[8]&ifNew);	vpc9 = so10[199]|(jVal[9]&ifNew);	vpc10 = so11[199]|(jVal[10]&ifNew);	vpc11 = so12[199]|(jVal[11]&ifNew);
		vpc12 = so13[199]|(jVal[12]&ifNew);	vpc13 = so14[199]|(jVal[13]&ifNew);	vpc14 = so15[199]|(jVal[14]&ifNew);	vpc15 = jVal[15]&ifNew;
		
		pc0 = jVal[0]?PCin:so1[198:135];	pc1 = jVal[1]?PCin:so2[198:135];	pc2 = jVal[2]?PCin:so3[198:135];	pc3 = jVal[3]?PCin:so4[198:135];
		pc4 = jVal[4]?PCin:so5[198:135];	pc5 = jVal[5]?PCin:so6[198:135];	pc6 = jVal[6]?PCin:so7[198:135];	pc7 = jVal[7]?PCin:so8[198:135];
		pc8 = jVal[8]?PCin:so9[198:135];	pc9 = jVal[9]?PCin:so10[198:135];	pc10 = jVal[10]?PCin:so11[198:135];	pc11 = jVal[11]?PCin:so12[198:135];
		pc12 = jVal[12]?PCin:so13[198:135];	pc13 = jVal[13]?PCin:so14[198:135];	pc14 = jVal[14]?PCin:so15[198:135];	pc15 = PCin;
		
		rob0 = jVal[0]?ROBin:so1[134:130];	rob1 = jVal[1]?ROBin:so2[134:130];	rob2 = jVal[2]?ROBin:so3[134:130];	rob3 = jVal[3]?ROBin:so4[134:130];
		rob4 = jVal[4]?ROBin:so5[134:130];	rob5 = jVal[5]?ROBin:so6[134:130];	rob6 = jVal[6]?ROBin:so7[134:130];	rob7 = jVal[7]?ROBin:so8[134:130];
		rob8 = jVal[8]?ROBin:so9[134:130];	rob9 = jVal[9]?ROBin:so10[134:130];	rob10 = jVal[10]?ROBin:so11[134:130];	rob11 = jVal[11]?ROBin:so12[134:130];
		rob12 = jVal[12]?ROBin:so13[134:130];	rob13 = jVal[13]?ROBin:so14[134:130];	rob14 = jVal[14]?ROBin:so15[134:130];	rob15 = ROBin;
		
		vaddr0 = so1[129]|maddr0;		vaddr1 = so2[129]|maddr1;		vaddr2 = so3[129]|maddr2;		vaddr3 = so4[129]|maddr3;
		vaddr4 = so5[129]|maddr4;		vaddr5 = so6[129]|maddr5;		vaddr6 = so7[129]|maddr6;		vaddr7 = so8[129]|maddr7;
		vaddr8 = so9[129]|maddr8;		vaddr9 = so10[129]|maddr9;		vaddr10 = so11[129]|maddr10;		vaddr11 = so12[129]|maddr11;
		vaddr12 = so13[129]|maddr12;		vaddr13 = so14[129]|maddr13;		vaddr14 = so15[129]|maddr14;		vaddr15 = maddr15;
		
		addr0 = maddr0?addrWrite:so1[128:65];	addr1 = maddr1?addrWrite:so2[128:65];	addr2 = maddr2?addrWrite:so3[128:65];	addr3 = maddr3?addrWrite:so4[128:65];
		addr4 = maddr4?addrWrite:so5[128:65];	addr5 = maddr5?addrWrite:so6[128:65];	addr6 = maddr6?addrWrite:so7[128:65];	addr7 = maddr7?addrWrite:so8[128:65];
		addr8 = maddr8?addrWrite:so9[128:65];	addr9 = maddr9?addrWrite:so10[128:65];	addr10 = maddr10?addrWrite:so11[128:65];addr11 = maddr11?addrWrite:so12[128:65];
		addr12 = maddr12?addrWrite:so13[128:65];addr13 = maddr13?addrWrite:so14[128:65];addr14 = maddr14?addrWrite:so15[128:65];addr15 = addrWrite;
		
		vVal0 = so1[64]|mval0;			vVal1 = so2[64]|mval1;			vVal2 = so3[64]|mval2;			vVal3 = so4[64]|mval3;
		vVal4 = so5[64]|mval4;			vVal5 = so6[64]|mval5;			vVal6 = so7[64]|mval6;			vVal7 = so8[64]|mval7;
		vVal8 = so9[64]|mval8;			vVal9 = so10[64]|mval9;			vVal10 = so11[64]|mval10;		vVal11 = so12[64]|mval11;
		vVal12 = so13[64]|mval12;		vVal13 = so14[64]|mval13;		vVal14 = so15[64]|mval14;		vVal15 = mval15;
		
		val0 = mval0?valWrite:so1[63:0];	val1 = mval1?valWrite:so2[63:0];	val2 = mval2?valWrite:so3[63:0];	val3 = mval3?valWrite:so4[63:0];
		val4 = mval4?valWrite:so5[63:0];	val5 = mval5?valWrite:so6[63:0];	val6 = mval6?valWrite:so7[63:0];	val7 = mval7?valWrite:so8[63:0];
		val8 = mval8?valWrite:so9[63:0];	val9 = mval9?valWrite:so10[63:0];	val10 = mval10?valWrite:so11[63:0];	val11 = mval11?valWrite:so12[63:0];
		val12 = mval12?valWrite:so13[63:0];	val13 = mval13?valWrite:so14[63:0];	val14 = mval14?valWrite:so15[63:0];	val15 = valWrite;
	end
	
	//mux control search ROB tags
	logic aXor0, aXor1, aXor2, aXor3, aXor4, aXor5, aXor6, aXor7, aXor8, aXor9, aXor10, aXor11, aXor12, aXor13, aXor14, aXor15;
	logic lXor0, lXor1, lXor2, lXor3, lXor4, lXor5, lXor6, lXor7, lXor8, lXor9, lXor10, lXor11, lXor12, lXor13, lXor14, lXor15;
	always_comb begin
		aXor0 = addrWriteROB^so0[4:0];		aXor1 = addrWriteROB^so1[4:0];		aXor2 = addrWriteROB^so2[4:0];		aXor3 = addrWriteROB^so3[4:0];
		aXor4 = addrWriteROB^so4[4:0];		aXor5 = addrWriteROB^so5[4:0];		aXor6 = addrWriteROB^so6[4:0];		aXor7 = addrWriteROB^so7[4:0];
		aXor8 = addrWriteROB^so8[4:0];		aXor9 = addrWriteROB^so9[4:0];		aXor10 = addrWriteROB^so10[4:0];	aXor11 = addrWriteROB^so11[4:0];
		aXor12 = addrWriteROB^so12[4:0];	aXor13 = addrWriteROB^so13[4:0];	aXor14 = addrWriteROB^so14[4:0];	aXor15 = addrWriteROB^so15[4:0];
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
	assign PCout = so0[199:135];
endmodule

