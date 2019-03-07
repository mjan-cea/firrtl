module Memory(
  input        clock,
  input        reset,
  input  [8:0] io_rdAddr,
  output [7:0] io_rdData,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [8:0] io_wrAddr
);
  reg [7:0] mem [0:255]; // @[Memory.scala 38:16]
  reg [31:0] _RAND_0;
  wire [7:0] mem_data_data; // @[Memory.scala 38:16]
  wire [7:0] mem_data_addr; // @[Memory.scala 38:16]
  wire [7:0] mem__T_45_data; // @[Memory.scala 38:16]
  wire [7:0] mem__T_45_addr; // @[Memory.scala 38:16]
  wire  mem__T_45_mask; // @[Memory.scala 38:16]
  wire  mem__T_45_en; // @[Memory.scala 38:16]
  reg [8:0] rdAddrReg; // @[Memory.scala 32:26]
  reg [31:0] _RAND_1;
  wire [7:0] _T_38; // @[Memory.scala 36:32]
  wire [2:0] _T_40;
  wire  _T_46; // @[Memory.scala 45:29]
  wire [7:0] _GEN_6; // @[Memory.scala 45:19]
  wire [7:0] _GEN_7; // @[Memory.scala 45:19]
  wire [7:0] _GEN_8; // @[Memory.scala 45:19]
  wire [7:0] _GEN_9; // @[Memory.scala 45:19]
  wire [7:0] _GEN_10; // @[Memory.scala 45:19]
  wire [7:0] _GEN_11; // @[Memory.scala 45:19]
  assign mem_data_addr = rdAddrReg[7:0];
  assign mem_data_data = mem[mem_data_addr]; // @[Memory.scala 38:16]
  assign mem__T_45_data = io_wrData;
  assign mem__T_45_addr = io_wrAddr[7:0];
  assign mem__T_45_mask = 1'h1;
  assign mem__T_45_en = io_wrEna;
  assign _T_38 = rdAddrReg[7:0]; // @[Memory.scala 36:32]
  assign _T_40 = _T_38[2:0];
  assign _T_46 = rdAddrReg[8]; // @[Memory.scala 45:29]
  assign _GEN_6 = 3'h1 == _T_40 ? 8'h23 : 8'hc7; // @[Memory.scala 45:19]
  assign _GEN_7 = 3'h2 == _T_40 ? 8'hc0 : _GEN_6; // @[Memory.scala 45:19]
  assign _GEN_8 = 3'h3 == _T_40 ? 8'h32 : _GEN_7; // @[Memory.scala 45:19]
  assign _GEN_9 = 3'h4 == _T_40 ? 8'hc1 : _GEN_8; // @[Memory.scala 45:19]
  assign _GEN_10 = 3'h5 == _T_40 ? 8'h55 : _GEN_9; // @[Memory.scala 45:19]
  assign _GEN_11 = 3'h6 == _T_40 ? 8'hff : _GEN_10; // @[Memory.scala 45:19]
  assign io_rdData = _T_46 ? mem_data_data : _GEN_11; // @[Memory.scala 45:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rdAddrReg = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem__T_45_en & mem__T_45_mask) begin
      mem[mem__T_45_addr] <= mem__T_45_data; // @[Memory.scala 38:16]
    end
    if (reset) begin
      rdAddrReg <= 9'h0;
    end else begin
      rdAddrReg <= io_rdAddr;
    end
  end
endmodule
module Lipsi(
  input        clock,
  input        reset,
  output [7:0] io_dout,
  input  [7:0] io_din
);
  wire  mem_clock; // @[Lipsi.scala 56:19]
  wire  mem_reset; // @[Lipsi.scala 56:19]
  wire [8:0] mem_io_rdAddr; // @[Lipsi.scala 56:19]
  wire [7:0] mem_io_rdData; // @[Lipsi.scala 56:19]
  wire  mem_io_wrEna; // @[Lipsi.scala 56:19]
  wire [7:0] mem_io_wrData; // @[Lipsi.scala 56:19]
  wire [8:0] mem_io_wrAddr; // @[Lipsi.scala 56:19]
  reg [7:0] pcReg; // @[Lipsi.scala 43:22]
  reg [31:0] _RAND_0;
  reg [7:0] accuReg; // @[Lipsi.scala 44:24]
  reg [31:0] _RAND_1;
  reg  enaAccuReg; // @[Lipsi.scala 45:27]
  reg [31:0] _RAND_2;
  reg  enaPcReg; // @[Lipsi.scala 47:25]
  reg [31:0] _RAND_3;
  reg [2:0] funcReg; // @[Lipsi.scala 49:24]
  reg [31:0] _RAND_4;
  reg [7:0] outReg; // @[Lipsi.scala 53:23]
  reg [31:0] _RAND_5;
  reg  enaIoReg; // @[Lipsi.scala 54:25]
  reg [31:0] _RAND_6;
  reg [2:0] stateReg; // @[Lipsi.scala 99:25]
  reg [31:0] _RAND_7;
  wire  _T_65; // @[Conditional.scala 37:30]
  wire [3:0] _T_76; // @[Lipsi.scala 131:18]
  wire  _T_78; // @[Lipsi.scala 131:25]
  wire [3:0] _T_80; // @[Lipsi.scala 132:38]
  wire [4:0] _T_81; // @[Cat.scala 30:58]
  wire [7:0] _GEN_7; // @[Lipsi.scala 131:40]
  wire [7:0] wrAddr; // @[Conditional.scala 40:58]
  wire [8:0] _T_38; // @[Lipsi.scala 89:19]
  wire [7:0] _T_39; // @[Lipsi.scala 89:19]
  wire [7:0] nextPC; // @[Lipsi.scala 91:18]
  wire [8:0] _T_35; // @[Cat.scala 30:58]
  wire  _T_92; // @[Lipsi.scala 143:25]
  wire  _T_85; // @[Lipsi.scala 137:25]
  wire  _T_67; // @[Lipsi.scala 124:18]
  wire  _T_69; // @[Lipsi.scala 124:22]
  wire  _GEN_3; // @[Lipsi.scala 124:35]
  wire  _GEN_10; // @[Lipsi.scala 137:40]
  wire  _GEN_13; // @[Lipsi.scala 143:40]
  wire  _T_111; // @[Conditional.scala 37:30]
  wire  _T_113; // @[Conditional.scala 37:30]
  wire  _T_114; // @[Conditional.scala 37:30]
  wire  _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_41; // @[Conditional.scala 39:67]
  wire  updPC; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_1; // @[Lipsi.scala 94:15]
  wire  accuZero; // @[Lipsi.scala 106:16]
  wire [1:0] _T_48; // @[Lipsi.scala 110:25]
  wire  _T_50; // @[Lipsi.scala 110:32]
  wire  _T_53; // @[Lipsi.scala 111:20]
  wire  _T_54; // @[Lipsi.scala 111:33]
  wire  _T_55; // @[Lipsi.scala 110:45]
  wire  _T_58; // @[Lipsi.scala 112:20]
  wire  _T_60; // @[Lipsi.scala 112:36]
  wire  _T_61; // @[Lipsi.scala 112:33]
  wire  doBranch; // @[Lipsi.scala 111:46]
  wire [2:0] _T_66; // @[Lipsi.scala 122:24]
  wire [8:0] _T_75; // @[Cat.scala 30:58]
  wire [2:0] _GEN_4; // @[Lipsi.scala 124:35]
  wire [8:0] _GEN_6; // @[Lipsi.scala 124:35]
  wire [2:0] _GEN_9; // @[Lipsi.scala 131:40]
  wire [8:0] _GEN_11; // @[Lipsi.scala 137:40]
  wire [2:0] _GEN_12; // @[Lipsi.scala 137:40]
  wire [8:0] _GEN_14; // @[Lipsi.scala 143:40]
  wire [2:0] _GEN_15; // @[Lipsi.scala 143:40]
  wire  _T_99; // @[Lipsi.scala 149:25]
  wire [2:0] _T_100; // @[Lipsi.scala 150:26]
  wire [2:0] _GEN_16; // @[Lipsi.scala 149:40]
  wire  _GEN_17; // @[Lipsi.scala 149:40]
  wire  _T_104; // @[Lipsi.scala 154:25]
  wire  _GEN_19; // @[Lipsi.scala 154:40]
  wire  _T_107; // @[Lipsi.scala 160:19]
  wire [7:0] _GEN_20; // @[Lipsi.scala 160:35]
  wire [2:0] _GEN_22; // @[Lipsi.scala 160:35]
  wire  _T_110; // @[Lipsi.scala 166:19]
  wire [2:0] _GEN_23; // @[Lipsi.scala 166:35]
  wire [8:0] _T_119; // @[Cat.scala 30:58]
  wire  _T_120; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_25; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_28; // @[Conditional.scala 39:67]
  wire [8:0] _GEN_30; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_31; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_33; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_36; // @[Conditional.scala 39:67]
  wire [8:0] _GEN_37; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_40; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_43; // @[Conditional.scala 39:67]
  wire [8:0] _GEN_44; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_46; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_47; // @[Conditional.scala 40:58]
  wire  _GEN_49; // @[Conditional.scala 40:58]
  wire  _GEN_53; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_54; // @[Conditional.scala 40:58]
  wire  _GEN_55; // @[Conditional.scala 40:58]
  wire  _T_125; // @[Conditional.scala 37:30]
  wire [8:0] _T_126; // @[Lipsi.scala 198:30]
  wire [7:0] _T_127; // @[Lipsi.scala 198:30]
  wire  _T_128; // @[Conditional.scala 37:30]
  wire [8:0] _T_129; // @[Lipsi.scala 199:30]
  wire [8:0] _T_130; // @[Lipsi.scala 199:30]
  wire [7:0] _T_131; // @[Lipsi.scala 199:30]
  wire  _T_132; // @[Conditional.scala 37:30]
  wire  _T_135; // @[Conditional.scala 37:30]
  wire  _T_139; // @[Conditional.scala 37:30]
  wire [7:0] _T_140; // @[Lipsi.scala 202:30]
  wire  _T_141; // @[Conditional.scala 37:30]
  wire [7:0] _T_142; // @[Lipsi.scala 203:29]
  wire  _T_143; // @[Conditional.scala 37:30]
  wire [7:0] _T_144; // @[Lipsi.scala 204:30]
  wire  _T_145; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_57; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_58; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_59; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_60; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_61; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_62; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_63; // @[Conditional.scala 39:67]
  wire [7:0] res; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_65; // @[Lipsi.scala 207:20]
  wire [7:0] _GEN_66; // @[Lipsi.scala 210:18]
  Memory mem ( // @[Lipsi.scala 56:19]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_rdAddr(mem_io_rdAddr),
    .io_rdData(mem_io_rdData),
    .io_wrEna(mem_io_wrEna),
    .io_wrData(mem_io_wrData),
    .io_wrAddr(mem_io_wrAddr)
  );
  assign _T_65 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  assign _T_76 = mem_io_rdData[7:4]; // @[Lipsi.scala 131:18]
  assign _T_78 = _T_76 == 4'h8; // @[Lipsi.scala 131:25]
  assign _T_80 = mem_io_rdData[3:0]; // @[Lipsi.scala 132:38]
  assign _T_81 = {1'h0,_T_80}; // @[Cat.scala 30:58]
  assign _GEN_7 = _T_78 ? {{3'd0}, _T_81} : mem_io_rdData; // @[Lipsi.scala 131:40]
  assign wrAddr = _T_65 ? _GEN_7 : mem_io_rdData; // @[Conditional.scala 40:58]
  assign _T_38 = pcReg + 8'h1; // @[Lipsi.scala 89:19]
  assign _T_39 = pcReg + 8'h1; // @[Lipsi.scala 89:19]
  assign nextPC = enaPcReg ? mem_io_rdData : _T_39; // @[Lipsi.scala 91:18]
  assign _T_35 = {1'h0,nextPC}; // @[Cat.scala 30:58]
  assign _T_92 = _T_76 == 4'hb; // @[Lipsi.scala 143:25]
  assign _T_85 = _T_76 == 4'ha; // @[Lipsi.scala 137:25]
  assign _T_67 = mem_io_rdData[7]; // @[Lipsi.scala 124:18]
  assign _T_69 = _T_67 == 1'h0; // @[Lipsi.scala 124:22]
  assign _GEN_3 = _T_69 ? 1'h0 : 1'h1; // @[Lipsi.scala 124:35]
  assign _GEN_10 = _T_85 ? 1'h0 : _GEN_3; // @[Lipsi.scala 137:40]
  assign _GEN_13 = _T_92 ? 1'h0 : _GEN_10; // @[Lipsi.scala 143:40]
  assign _T_111 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  assign _T_113 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  assign _T_114 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  assign _GEN_27 = _T_114 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67]
  assign _GEN_34 = _T_113 ? 1'h1 : _GEN_27; // @[Conditional.scala 39:67]
  assign _GEN_41 = _T_111 ? 1'h1 : _GEN_34; // @[Conditional.scala 39:67]
  assign updPC = _T_65 ? _GEN_13 : _GEN_41; // @[Conditional.scala 40:58]
  assign _GEN_1 = updPC ? nextPC : pcReg; // @[Lipsi.scala 94:15]
  assign accuZero = accuReg == 8'h0; // @[Lipsi.scala 106:16]
  assign _T_48 = mem_io_rdData[1:0]; // @[Lipsi.scala 110:25]
  assign _T_50 = _T_48 == 2'h0; // @[Lipsi.scala 110:32]
  assign _T_53 = _T_48 == 2'h2; // @[Lipsi.scala 111:20]
  assign _T_54 = _T_53 & accuZero; // @[Lipsi.scala 111:33]
  assign _T_55 = _T_50 | _T_54; // @[Lipsi.scala 110:45]
  assign _T_58 = _T_48 == 2'h3; // @[Lipsi.scala 112:20]
  assign _T_60 = accuZero == 1'h0; // @[Lipsi.scala 112:36]
  assign _T_61 = _T_58 & _T_60; // @[Lipsi.scala 112:33]
  assign doBranch = _T_55 | _T_61; // @[Lipsi.scala 111:46]
  assign _T_66 = mem_io_rdData[6:4]; // @[Lipsi.scala 122:24]
  assign _T_75 = {5'h10,_T_80}; // @[Cat.scala 30:58]
  assign _GEN_4 = _T_69 ? _T_66 : _T_66; // @[Lipsi.scala 124:35]
  assign _GEN_6 = _T_69 ? _T_75 : _T_35; // @[Lipsi.scala 124:35]
  assign _GEN_9 = _T_78 ? 3'h0 : 3'h1; // @[Lipsi.scala 131:40]
  assign _GEN_11 = _T_85 ? _T_75 : _GEN_6; // @[Lipsi.scala 137:40]
  assign _GEN_12 = _T_85 ? 3'h3 : _GEN_9; // @[Lipsi.scala 137:40]
  assign _GEN_14 = _T_92 ? _T_75 : _GEN_11; // @[Lipsi.scala 143:40]
  assign _GEN_15 = _T_92 ? 3'h2 : _GEN_12; // @[Lipsi.scala 143:40]
  assign _T_99 = _T_76 == 4'hc; // @[Lipsi.scala 149:25]
  assign _T_100 = mem_io_rdData[2:0]; // @[Lipsi.scala 150:26]
  assign _GEN_16 = _T_99 ? _T_100 : _GEN_4; // @[Lipsi.scala 149:40]
  assign _GEN_17 = _T_99 ? 1'h1 : _T_69; // @[Lipsi.scala 149:40]
  assign _T_104 = _T_76 == 4'hd; // @[Lipsi.scala 154:25]
  assign _GEN_19 = _T_104 ? doBranch : 1'h0; // @[Lipsi.scala 154:40]
  assign _T_107 = mem_io_rdData == 8'hf0; // @[Lipsi.scala 160:19]
  assign _GEN_20 = _T_107 ? accuReg : outReg; // @[Lipsi.scala 160:35]
  assign _GEN_22 = _T_107 ? 3'h0 : _GEN_15; // @[Lipsi.scala 160:35]
  assign _T_110 = mem_io_rdData == 8'hff; // @[Lipsi.scala 166:19]
  assign _GEN_23 = _T_110 ? 3'h5 : _GEN_22; // @[Lipsi.scala 166:35]
  assign _T_119 = {1'h1,mem_io_rdData}; // @[Cat.scala 30:58]
  assign _T_120 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  assign _GEN_25 = _T_120 ? 3'h0 : stateReg; // @[Conditional.scala 39:67]
  assign _GEN_28 = _T_114 ? 3'h7 : funcReg; // @[Conditional.scala 39:67]
  assign _GEN_30 = _T_114 ? _T_119 : _T_35; // @[Conditional.scala 39:67]
  assign _GEN_31 = _T_114 ? 3'h4 : _GEN_25; // @[Conditional.scala 39:67]
  assign _GEN_33 = _T_113 ? 3'h0 : _GEN_31; // @[Conditional.scala 39:67]
  assign _GEN_35 = _T_113 ? funcReg : _GEN_28; // @[Conditional.scala 39:67]
  assign _GEN_36 = _T_113 ? 1'h0 : _T_114; // @[Conditional.scala 39:67]
  assign _GEN_37 = _T_113 ? _T_35 : _GEN_30; // @[Conditional.scala 39:67]
  assign _GEN_40 = _T_111 ? 3'h0 : _GEN_33; // @[Conditional.scala 39:67]
  assign _GEN_42 = _T_111 ? funcReg : _GEN_35; // @[Conditional.scala 39:67]
  assign _GEN_43 = _T_111 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  assign _GEN_44 = _T_111 ? _T_35 : _GEN_37; // @[Conditional.scala 39:67]
  assign _GEN_46 = _T_65 ? _GEN_23 : _GEN_40; // @[Conditional.scala 40:58]
  assign _GEN_47 = _T_65 ? _GEN_16 : _GEN_42; // @[Conditional.scala 40:58]
  assign _GEN_49 = _T_65 ? _GEN_17 : _GEN_43; // @[Conditional.scala 40:58]
  assign _GEN_53 = _T_65 ? _GEN_19 : 1'h0; // @[Conditional.scala 40:58]
  assign _GEN_54 = _T_65 ? _GEN_20 : outReg; // @[Conditional.scala 40:58]
  assign _GEN_55 = _T_65 ? _T_107 : 1'h0; // @[Conditional.scala 40:58]
  assign _T_125 = 3'h0 == funcReg; // @[Conditional.scala 37:30]
  assign _T_126 = accuReg + mem_io_rdData; // @[Lipsi.scala 198:30]
  assign _T_127 = accuReg + mem_io_rdData; // @[Lipsi.scala 198:30]
  assign _T_128 = 3'h1 == funcReg; // @[Conditional.scala 37:30]
  assign _T_129 = accuReg - mem_io_rdData; // @[Lipsi.scala 199:30]
  assign _T_130 = $unsigned(_T_129); // @[Lipsi.scala 199:30]
  assign _T_131 = _T_130[7:0]; // @[Lipsi.scala 199:30]
  assign _T_132 = 3'h2 == funcReg; // @[Conditional.scala 37:30]
  assign _T_135 = 3'h3 == funcReg; // @[Conditional.scala 37:30]
  assign _T_139 = 3'h4 == funcReg; // @[Conditional.scala 37:30]
  assign _T_140 = accuReg & mem_io_rdData; // @[Lipsi.scala 202:30]
  assign _T_141 = 3'h5 == funcReg; // @[Conditional.scala 37:30]
  assign _T_142 = accuReg | mem_io_rdData; // @[Lipsi.scala 203:29]
  assign _T_143 = 3'h6 == funcReg; // @[Conditional.scala 37:30]
  assign _T_144 = accuReg ^ mem_io_rdData; // @[Lipsi.scala 204:30]
  assign _T_145 = 3'h7 == funcReg; // @[Conditional.scala 37:30]
  assign _GEN_57 = _T_145 ? mem_io_rdData : 8'h0; // @[Conditional.scala 39:67]
  assign _GEN_58 = _T_143 ? _T_144 : _GEN_57; // @[Conditional.scala 39:67]
  assign _GEN_59 = _T_141 ? _T_142 : _GEN_58; // @[Conditional.scala 39:67]
  assign _GEN_60 = _T_139 ? _T_140 : _GEN_59; // @[Conditional.scala 39:67]
  assign _GEN_61 = _T_135 ? _T_131 : _GEN_60; // @[Conditional.scala 39:67]
  assign _GEN_62 = _T_132 ? _T_127 : _GEN_61; // @[Conditional.scala 39:67]
  assign _GEN_63 = _T_128 ? _T_131 : _GEN_62; // @[Conditional.scala 39:67]
  assign res = _T_125 ? _T_127 : _GEN_63; // @[Conditional.scala 40:58]
  assign _GEN_65 = enaAccuReg ? res : accuReg; // @[Lipsi.scala 207:20]
  assign _GEN_66 = enaIoReg ? io_din : _GEN_65; // @[Lipsi.scala 210:18]
  assign io_dout = outReg; // @[Lipsi.scala 214:11]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_rdAddr = _T_65 ? _GEN_14 : _GEN_44; // @[Lipsi.scala 78:17]
  assign mem_io_wrEna = _T_65 ? _T_78 : _T_111; // @[Lipsi.scala 81:16]
  assign mem_io_wrData = accuReg; // @[Lipsi.scala 80:17]
  assign mem_io_wrAddr = {1'h1,wrAddr}; // @[Lipsi.scala 79:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  accuReg = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enaAccuReg = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enaPcReg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  funcReg = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  outReg = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  enaIoReg = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  stateReg = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      pcReg <= 8'h0;
    end else begin
      if (updPC) begin
        if (enaPcReg) begin
          pcReg <= mem_io_rdData;
        end else begin
          pcReg <= _T_39;
        end
      end
    end
    if (reset) begin
      accuReg <= 8'h0;
    end else begin
      if (enaIoReg) begin
        accuReg <= io_din;
      end else begin
        if (enaAccuReg) begin
          if (_T_125) begin
            accuReg <= _T_127;
          end else begin
            if (_T_128) begin
              accuReg <= _T_131;
            end else begin
              if (_T_132) begin
                accuReg <= _T_127;
              end else begin
                if (_T_135) begin
                  accuReg <= _T_131;
                end else begin
                  if (_T_139) begin
                    accuReg <= _T_140;
                  end else begin
                    if (_T_141) begin
                      accuReg <= _T_142;
                    end else begin
                      if (_T_143) begin
                        accuReg <= _T_144;
                      end else begin
                        if (_T_145) begin
                          accuReg <= mem_io_rdData;
                        end else begin
                          accuReg <= 8'h0;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      enaAccuReg <= 1'h0;
    end else begin
      if (_T_65) begin
        if (_T_99) begin
          enaAccuReg <= 1'h1;
        end else begin
          enaAccuReg <= _T_69;
        end
      end else begin
        if (_T_111) begin
          enaAccuReg <= 1'h0;
        end else begin
          if (_T_113) begin
            enaAccuReg <= 1'h0;
          end else begin
            enaAccuReg <= _T_114;
          end
        end
      end
    end
    if (reset) begin
      enaPcReg <= 1'h0;
    end else begin
      if (_T_65) begin
        if (_T_104) begin
          enaPcReg <= doBranch;
        end else begin
          enaPcReg <= 1'h0;
        end
      end else begin
        enaPcReg <= 1'h0;
      end
    end
    if (reset) begin
      funcReg <= 3'h0;
    end else begin
      if (_T_65) begin
        if (_T_99) begin
          funcReg <= _T_100;
        end else begin
          if (_T_69) begin
            funcReg <= _T_66;
          end else begin
            funcReg <= _T_66;
          end
        end
      end else begin
        if (!(_T_111)) begin
          if (!(_T_113)) begin
            if (_T_114) begin
              funcReg <= 3'h7;
            end
          end
        end
      end
    end
    if (reset) begin
      outReg <= 8'h0;
    end else begin
      if (_T_65) begin
        if (_T_107) begin
          outReg <= accuReg;
        end
      end
    end
    if (reset) begin
      enaIoReg <= 1'h0;
    end else begin
      if (_T_65) begin
        enaIoReg <= _T_107;
      end else begin
        enaIoReg <= 1'h0;
      end
    end
    if (reset) begin
      stateReg <= 3'h0;
    end else begin
      if (_T_65) begin
        if (_T_110) begin
          stateReg <= 3'h5;
        end else begin
          if (_T_107) begin
            stateReg <= 3'h0;
          end else begin
            if (_T_92) begin
              stateReg <= 3'h2;
            end else begin
              if (_T_85) begin
                stateReg <= 3'h3;
              end else begin
                if (_T_78) begin
                  stateReg <= 3'h0;
                end else begin
                  stateReg <= 3'h1;
                end
              end
            end
          end
        end
      end else begin
        if (_T_111) begin
          stateReg <= 3'h0;
        end else begin
          if (_T_113) begin
            stateReg <= 3'h0;
          end else begin
            if (_T_114) begin
              stateReg <= 3'h4;
            end else begin
              if (_T_120) begin
                stateReg <= 3'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
