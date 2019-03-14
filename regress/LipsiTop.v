module Memory( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [8:0] io_rdAddr, // @[:@6.4]
  output [7:0] io_rdData, // @[:@6.4]
  input        io_wrEna, // @[:@6.4]
  input  [7:0] io_wrData, // @[:@6.4]
  input  [8:0] io_wrAddr // @[:@6.4]
);
  reg [7:0] mem [0:255]; // @[Memory.scala 39:16:@21.4]
  reg [31:0] _RAND_0;
  wire [7:0] mem_data_data; // @[Memory.scala 39:16:@21.4]
  wire [7:0] mem_data_addr; // @[Memory.scala 39:16:@21.4]
  wire [7:0] mem__T_45_data; // @[Memory.scala 39:16:@21.4]
  wire [7:0] mem__T_45_addr; // @[Memory.scala 39:16:@21.4]
  wire  mem__T_45_mask; // @[Memory.scala 39:16:@21.4]
  wire  mem__T_45_en; // @[Memory.scala 39:16:@21.4]
  reg [8:0] rdAddrReg; // @[Memory.scala 32:26:@9.4]
  reg [31:0] _RAND_1;
  wire [7:0] _T_38; // @[Memory.scala 36:32:@19.4]
  wire [2:0] _T_40; // @[:@20.4]
  wire  _T_46; // @[Memory.scala 46:29:@29.4]
  wire [7:0] _GEN_6; // @[Memory.scala 46:19:@30.4]
  wire [7:0] _GEN_7; // @[Memory.scala 46:19:@30.4]
  wire [7:0] _GEN_8; // @[Memory.scala 46:19:@30.4]
  wire [7:0] _GEN_9; // @[Memory.scala 46:19:@30.4]
  wire [7:0] _GEN_10; // @[Memory.scala 46:19:@30.4]
  wire [7:0] _GEN_11; // @[Memory.scala 46:19:@30.4]
  assign mem_data_addr = rdAddrReg[7:0];
  assign mem_data_data = mem[mem_data_addr]; // @[Memory.scala 39:16:@21.4]
  assign mem__T_45_data = io_wrData;
  assign mem__T_45_addr = io_wrAddr[7:0];
  assign mem__T_45_mask = 1'h1;
  assign mem__T_45_en = io_wrEna;
  assign _T_38 = rdAddrReg[7:0]; // @[Memory.scala 36:32:@19.4]
  assign _T_40 = _T_38[2:0]; // @[:@20.4]
  assign _T_46 = rdAddrReg[8]; // @[Memory.scala 46:29:@29.4]
  assign _GEN_6 = 3'h1 == _T_40 ? 8'h23 : 8'hc7; // @[Memory.scala 46:19:@30.4]
  assign _GEN_7 = 3'h2 == _T_40 ? 8'hc0 : _GEN_6; // @[Memory.scala 46:19:@30.4]
  assign _GEN_8 = 3'h3 == _T_40 ? 8'h32 : _GEN_7; // @[Memory.scala 46:19:@30.4]
  assign _GEN_9 = 3'h4 == _T_40 ? 8'hc1 : _GEN_8; // @[Memory.scala 46:19:@30.4]
  assign _GEN_10 = 3'h5 == _T_40 ? 8'h55 : _GEN_9; // @[Memory.scala 46:19:@30.4]
  assign _GEN_11 = 3'h6 == _T_40 ? 8'hff : _GEN_10; // @[Memory.scala 46:19:@30.4]
  assign io_rdData = _T_46 ? mem_data_data : _GEN_11; // @[Memory.scala 46:13:@31.4]
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
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
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
      mem[mem__T_45_addr] <= mem__T_45_data; // @[Memory.scala 39:16:@21.4]
    end
    if (reset) begin
      rdAddrReg <= 9'h0;
    end else begin
      rdAddrReg <= io_rdAddr;
    end
  end
endmodule
module Lipsi( // @[:@33.2]
  input        clock, // @[:@34.4]
  input        reset, // @[:@35.4]
  output [7:0] io_dout, // @[:@36.4]
  input  [7:0] io_din, // @[:@36.4]
  output [7:0] io_dbg_pc, // @[:@36.4]
  output [7:0] io_dbg_accu, // @[:@36.4]
  output       io_dbg_exit // @[:@36.4]
);
  wire  mem_clock; // @[Lipsi.scala 63:19:@45.4]
  wire  mem_reset; // @[Lipsi.scala 63:19:@45.4]
  wire [8:0] mem_io_rdAddr; // @[Lipsi.scala 63:19:@45.4]
  wire [7:0] mem_io_rdData; // @[Lipsi.scala 63:19:@45.4]
  wire  mem_io_wrEna; // @[Lipsi.scala 63:19:@45.4]
  wire [7:0] mem_io_wrData; // @[Lipsi.scala 63:19:@45.4]
  wire [8:0] mem_io_wrAddr; // @[Lipsi.scala 63:19:@45.4]
  reg [7:0] pcReg; // @[Lipsi.scala 50:22:@38.4]
  reg [31:0] _RAND_0;
  reg [7:0] accuReg; // @[Lipsi.scala 51:24:@39.4]
  reg [31:0] _RAND_1;
  reg  enaAccuReg; // @[Lipsi.scala 52:27:@40.4]
  reg [31:0] _RAND_2;
  reg  enaPcReg; // @[Lipsi.scala 54:25:@41.4]
  reg [31:0] _RAND_3;
  reg [2:0] funcReg; // @[Lipsi.scala 56:24:@42.4]
  reg [31:0] _RAND_4;
  reg [7:0] outReg; // @[Lipsi.scala 60:23:@43.4]
  reg [31:0] _RAND_5;
  reg  enaIoReg; // @[Lipsi.scala 61:25:@44.4]
  reg [31:0] _RAND_6;
  reg [2:0] stateReg; // @[Lipsi.scala 106:25:@76.4]
  reg [31:0] _RAND_7;
  wire  _T_63; // @[Conditional.scala 37:30:@93.4]
  wire [3:0] _T_74; // @[Lipsi.scala 135:18:@109.6]
  wire  _T_76; // @[Lipsi.scala 135:25:@110.6]
  wire [3:0] _T_78; // @[Lipsi.scala 136:34:@112.8]
  wire [4:0] _T_79; // @[Cat.scala 30:58:@113.8]
  wire [7:0] _GEN_6; // @[Lipsi.scala 135:36:@111.6]
  wire [7:0] wrAddr; // @[Conditional.scala 40:58:@94.4]
  wire [8:0] _T_40; // @[Lipsi.scala 96:19:@67.4]
  wire [7:0] _T_41; // @[Lipsi.scala 96:19:@68.4]
  wire [7:0] nextPC; // @[Lipsi.scala 98:18:@70.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@64.4]
  wire  _T_90; // @[Lipsi.scala 147:25:@128.6]
  wire  _T_83; // @[Lipsi.scala 141:25:@119.6]
  wire  _T_65; // @[Lipsi.scala 128:18:@98.6]
  wire  _T_67; // @[Lipsi.scala 128:22:@99.6]
  wire  _GEN_2; // @[Lipsi.scala 128:31:@100.6]
  wire  _GEN_9; // @[Lipsi.scala 141:36:@120.6]
  wire  _GEN_12; // @[Lipsi.scala 147:36:@129.6]
  wire  _T_109; // @[Conditional.scala 37:30:@162.6]
  wire  _T_111; // @[Conditional.scala 37:30:@168.8]
  wire  _T_112; // @[Conditional.scala 37:30:@173.10]
  wire  _GEN_26; // @[Conditional.scala 39:67:@174.10]
  wire  _GEN_33; // @[Conditional.scala 39:67:@169.8]
  wire  _GEN_40; // @[Conditional.scala 39:67:@163.6]
  wire  updPC; // @[Conditional.scala 40:58:@94.4]
  wire [7:0] _GEN_1; // @[Lipsi.scala 101:15:@73.4]
  reg  exitReg; // @[Lipsi.scala 109:24:@77.4]
  reg [31:0] _RAND_8;
  wire  accuZero; // @[Lipsi.scala 112:26:@78.4]
  wire [1:0] _T_46; // @[Lipsi.scala 114:25:@79.4]
  wire  _T_48; // @[Lipsi.scala 114:32:@80.4]
  wire  _T_51; // @[Lipsi.scala 115:20:@82.4]
  wire  _T_52; // @[Lipsi.scala 115:29:@83.4]
  wire  _T_53; // @[Lipsi.scala 114:41:@84.4]
  wire  _T_56; // @[Lipsi.scala 116:20:@86.4]
  wire  _T_58; // @[Lipsi.scala 116:32:@87.4]
  wire  _T_59; // @[Lipsi.scala 116:29:@88.4]
  wire  doBranch; // @[Lipsi.scala 115:42:@89.4]
  wire [2:0] _T_64; // @[Lipsi.scala 126:24:@96.6]
  wire [8:0] _T_73; // @[Cat.scala 30:58:@106.8]
  wire [2:0] _GEN_3; // @[Lipsi.scala 128:31:@100.6]
  wire [8:0] _GEN_5; // @[Lipsi.scala 128:31:@100.6]
  wire [2:0] _GEN_8; // @[Lipsi.scala 135:36:@111.6]
  wire [8:0] _GEN_10; // @[Lipsi.scala 141:36:@120.6]
  wire [2:0] _GEN_11; // @[Lipsi.scala 141:36:@120.6]
  wire [8:0] _GEN_13; // @[Lipsi.scala 147:36:@129.6]
  wire [2:0] _GEN_14; // @[Lipsi.scala 147:36:@129.6]
  wire  _T_97; // @[Lipsi.scala 153:25:@137.6]
  wire [2:0] _T_98; // @[Lipsi.scala 154:26:@139.8]
  wire [2:0] _GEN_15; // @[Lipsi.scala 153:36:@138.6]
  wire  _GEN_16; // @[Lipsi.scala 153:36:@138.6]
  wire  _T_102; // @[Lipsi.scala 158:25:@144.6]
  wire  _GEN_18; // @[Lipsi.scala 158:36:@145.6]
  wire  _T_105; // @[Lipsi.scala 164:19:@150.6]
  wire [7:0] _GEN_19; // @[Lipsi.scala 164:31:@151.6]
  wire [2:0] _GEN_21; // @[Lipsi.scala 164:31:@151.6]
  wire  _T_108; // @[Lipsi.scala 170:19:@156.6]
  wire [2:0] _GEN_22; // @[Lipsi.scala 170:31:@157.6]
  wire [8:0] _T_117; // @[Cat.scala 30:58:@178.12]
  wire  _T_118; // @[Conditional.scala 37:30:@183.12]
  wire  _T_119; // @[Conditional.scala 37:30:@188.14]
  wire  _GEN_23; // @[Conditional.scala 39:67:@189.14]
  wire [2:0] _GEN_24; // @[Conditional.scala 39:67:@184.12]
  wire  _GEN_25; // @[Conditional.scala 39:67:@184.12]
  wire [2:0] _GEN_27; // @[Conditional.scala 39:67:@174.10]
  wire [8:0] _GEN_29; // @[Conditional.scala 39:67:@174.10]
  wire [2:0] _GEN_30; // @[Conditional.scala 39:67:@174.10]
  wire  _GEN_31; // @[Conditional.scala 39:67:@174.10]
  wire [2:0] _GEN_32; // @[Conditional.scala 39:67:@169.8]
  wire [2:0] _GEN_34; // @[Conditional.scala 39:67:@169.8]
  wire  _GEN_35; // @[Conditional.scala 39:67:@169.8]
  wire [8:0] _GEN_36; // @[Conditional.scala 39:67:@169.8]
  wire  _GEN_37; // @[Conditional.scala 39:67:@169.8]
  wire [2:0] _GEN_39; // @[Conditional.scala 39:67:@163.6]
  wire [2:0] _GEN_41; // @[Conditional.scala 39:67:@163.6]
  wire  _GEN_42; // @[Conditional.scala 39:67:@163.6]
  wire [8:0] _GEN_43; // @[Conditional.scala 39:67:@163.6]
  wire  _GEN_44; // @[Conditional.scala 39:67:@163.6]
  wire [2:0] _GEN_45; // @[Conditional.scala 40:58:@94.4]
  wire [2:0] _GEN_46; // @[Conditional.scala 40:58:@94.4]
  wire  _GEN_48; // @[Conditional.scala 40:58:@94.4]
  wire  _GEN_52; // @[Conditional.scala 40:58:@94.4]
  wire [7:0] _GEN_53; // @[Conditional.scala 40:58:@94.4]
  wire  _GEN_54; // @[Conditional.scala 40:58:@94.4]
  wire  _GEN_55; // @[Conditional.scala 40:58:@94.4]
  wire  _T_123; // @[Conditional.scala 37:30:@194.4]
  wire [8:0] _T_124; // @[Lipsi.scala 202:30:@196.6]
  wire [7:0] _T_125; // @[Lipsi.scala 202:30:@197.6]
  wire  _T_126; // @[Conditional.scala 37:30:@201.6]
  wire [8:0] _T_127; // @[Lipsi.scala 203:30:@203.8]
  wire [8:0] _T_128; // @[Lipsi.scala 203:30:@204.8]
  wire [7:0] _T_129; // @[Lipsi.scala 203:30:@205.8]
  wire  _T_130; // @[Conditional.scala 37:30:@209.8]
  wire  _T_133; // @[Conditional.scala 37:30:@216.10]
  wire  _T_137; // @[Conditional.scala 37:30:@224.12]
  wire [7:0] _T_138; // @[Lipsi.scala 206:30:@226.14]
  wire  _T_139; // @[Conditional.scala 37:30:@230.14]
  wire [7:0] _T_140; // @[Lipsi.scala 207:29:@232.16]
  wire  _T_141; // @[Conditional.scala 37:30:@236.16]
  wire [7:0] _T_142; // @[Lipsi.scala 208:30:@238.18]
  wire  _T_143; // @[Conditional.scala 37:30:@242.18]
  wire [7:0] _GEN_56; // @[Conditional.scala 39:67:@243.18]
  wire [7:0] _GEN_57; // @[Conditional.scala 39:67:@237.16]
  wire [7:0] _GEN_58; // @[Conditional.scala 39:67:@231.14]
  wire [7:0] _GEN_59; // @[Conditional.scala 39:67:@225.12]
  wire [7:0] _GEN_60; // @[Conditional.scala 39:67:@217.10]
  wire [7:0] _GEN_61; // @[Conditional.scala 39:67:@210.8]
  wire [7:0] _GEN_62; // @[Conditional.scala 39:67:@202.6]
  wire [7:0] res; // @[Conditional.scala 40:58:@195.4]
  wire [7:0] _GEN_64; // @[Lipsi.scala 211:20:@246.4]
  wire [7:0] _GEN_65; // @[Lipsi.scala 214:18:@249.4]
  Memory mem ( // @[Lipsi.scala 63:19:@45.4]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_rdAddr(mem_io_rdAddr),
    .io_rdData(mem_io_rdData),
    .io_wrEna(mem_io_wrEna),
    .io_wrData(mem_io_wrData),
    .io_wrAddr(mem_io_wrAddr)
  );
  assign _T_63 = 3'h0 == stateReg; // @[Conditional.scala 37:30:@93.4]
  assign _T_74 = mem_io_rdData[7:4]; // @[Lipsi.scala 135:18:@109.6]
  assign _T_76 = _T_74 == 4'h8; // @[Lipsi.scala 135:25:@110.6]
  assign _T_78 = mem_io_rdData[3:0]; // @[Lipsi.scala 136:34:@112.8]
  assign _T_79 = {1'h0,_T_78}; // @[Cat.scala 30:58:@113.8]
  assign _GEN_6 = _T_76 ? {{3'd0}, _T_79} : mem_io_rdData; // @[Lipsi.scala 135:36:@111.6]
  assign wrAddr = _T_63 ? _GEN_6 : mem_io_rdData; // @[Conditional.scala 40:58:@94.4]
  assign _T_40 = pcReg + 8'h1; // @[Lipsi.scala 96:19:@67.4]
  assign _T_41 = _T_40[7:0]; // @[Lipsi.scala 96:19:@68.4]
  assign nextPC = enaPcReg ? mem_io_rdData : _T_41; // @[Lipsi.scala 98:18:@70.4]
  assign _T_37 = {1'h0,nextPC}; // @[Cat.scala 30:58:@64.4]
  assign _T_90 = _T_74 == 4'hb; // @[Lipsi.scala 147:25:@128.6]
  assign _T_83 = _T_74 == 4'ha; // @[Lipsi.scala 141:25:@119.6]
  assign _T_65 = mem_io_rdData[7]; // @[Lipsi.scala 128:18:@98.6]
  assign _T_67 = _T_65 == 1'h0; // @[Lipsi.scala 128:22:@99.6]
  assign _GEN_2 = _T_67 ? 1'h0 : 1'h1; // @[Lipsi.scala 128:31:@100.6]
  assign _GEN_9 = _T_83 ? 1'h0 : _GEN_2; // @[Lipsi.scala 141:36:@120.6]
  assign _GEN_12 = _T_90 ? 1'h0 : _GEN_9; // @[Lipsi.scala 147:36:@129.6]
  assign _T_109 = 3'h2 == stateReg; // @[Conditional.scala 37:30:@162.6]
  assign _T_111 = 3'h1 == stateReg; // @[Conditional.scala 37:30:@168.8]
  assign _T_112 = 3'h3 == stateReg; // @[Conditional.scala 37:30:@173.10]
  assign _GEN_26 = _T_112 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67:@174.10]
  assign _GEN_33 = _T_111 ? 1'h1 : _GEN_26; // @[Conditional.scala 39:67:@169.8]
  assign _GEN_40 = _T_109 ? 1'h1 : _GEN_33; // @[Conditional.scala 39:67:@163.6]
  assign updPC = _T_63 ? _GEN_12 : _GEN_40; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_1 = updPC ? nextPC : pcReg; // @[Lipsi.scala 101:15:@73.4]
  assign accuZero = accuReg == 8'h0; // @[Lipsi.scala 112:26:@78.4]
  assign _T_46 = mem_io_rdData[1:0]; // @[Lipsi.scala 114:25:@79.4]
  assign _T_48 = _T_46 == 2'h0; // @[Lipsi.scala 114:32:@80.4]
  assign _T_51 = _T_46 == 2'h2; // @[Lipsi.scala 115:20:@82.4]
  assign _T_52 = _T_51 & accuZero; // @[Lipsi.scala 115:29:@83.4]
  assign _T_53 = _T_48 | _T_52; // @[Lipsi.scala 114:41:@84.4]
  assign _T_56 = _T_46 == 2'h3; // @[Lipsi.scala 116:20:@86.4]
  assign _T_58 = accuZero == 1'h0; // @[Lipsi.scala 116:32:@87.4]
  assign _T_59 = _T_56 & _T_58; // @[Lipsi.scala 116:29:@88.4]
  assign doBranch = _T_53 | _T_59; // @[Lipsi.scala 115:42:@89.4]
  assign _T_64 = mem_io_rdData[6:4]; // @[Lipsi.scala 126:24:@96.6]
  assign _T_73 = {5'h10,_T_78}; // @[Cat.scala 30:58:@106.8]
  assign _GEN_3 = _T_67 ? _T_64 : _T_64; // @[Lipsi.scala 128:31:@100.6]
  assign _GEN_5 = _T_67 ? _T_73 : _T_37; // @[Lipsi.scala 128:31:@100.6]
  assign _GEN_8 = _T_76 ? 3'h0 : 3'h1; // @[Lipsi.scala 135:36:@111.6]
  assign _GEN_10 = _T_83 ? _T_73 : _GEN_5; // @[Lipsi.scala 141:36:@120.6]
  assign _GEN_11 = _T_83 ? 3'h3 : _GEN_8; // @[Lipsi.scala 141:36:@120.6]
  assign _GEN_13 = _T_90 ? _T_73 : _GEN_10; // @[Lipsi.scala 147:36:@129.6]
  assign _GEN_14 = _T_90 ? 3'h2 : _GEN_11; // @[Lipsi.scala 147:36:@129.6]
  assign _T_97 = _T_74 == 4'hc; // @[Lipsi.scala 153:25:@137.6]
  assign _T_98 = mem_io_rdData[2:0]; // @[Lipsi.scala 154:26:@139.8]
  assign _GEN_15 = _T_97 ? _T_98 : _GEN_3; // @[Lipsi.scala 153:36:@138.6]
  assign _GEN_16 = _T_97 ? 1'h1 : _T_67; // @[Lipsi.scala 153:36:@138.6]
  assign _T_102 = _T_74 == 4'hd; // @[Lipsi.scala 158:25:@144.6]
  assign _GEN_18 = _T_102 ? doBranch : 1'h0; // @[Lipsi.scala 158:36:@145.6]
  assign _T_105 = mem_io_rdData == 8'hf0; // @[Lipsi.scala 164:19:@150.6]
  assign _GEN_19 = _T_105 ? accuReg : outReg; // @[Lipsi.scala 164:31:@151.6]
  assign _GEN_21 = _T_105 ? 3'h0 : _GEN_14; // @[Lipsi.scala 164:31:@151.6]
  assign _T_108 = mem_io_rdData == 8'hff; // @[Lipsi.scala 170:19:@156.6]
  assign _GEN_22 = _T_108 ? 3'h5 : _GEN_21; // @[Lipsi.scala 170:31:@157.6]
  assign _T_117 = {1'h1,mem_io_rdData}; // @[Cat.scala 30:58:@178.12]
  assign _T_118 = 3'h4 == stateReg; // @[Conditional.scala 37:30:@183.12]
  assign _T_119 = 3'h5 == stateReg; // @[Conditional.scala 37:30:@188.14]
  assign _GEN_23 = _T_119 ? 1'h1 : exitReg; // @[Conditional.scala 39:67:@189.14]
  assign _GEN_24 = _T_118 ? 3'h0 : stateReg; // @[Conditional.scala 39:67:@184.12]
  assign _GEN_25 = _T_118 ? exitReg : _GEN_23; // @[Conditional.scala 39:67:@184.12]
  assign _GEN_27 = _T_112 ? 3'h7 : funcReg; // @[Conditional.scala 39:67:@174.10]
  assign _GEN_29 = _T_112 ? _T_117 : _T_37; // @[Conditional.scala 39:67:@174.10]
  assign _GEN_30 = _T_112 ? 3'h4 : _GEN_24; // @[Conditional.scala 39:67:@174.10]
  assign _GEN_31 = _T_112 ? exitReg : _GEN_25; // @[Conditional.scala 39:67:@174.10]
  assign _GEN_32 = _T_111 ? 3'h0 : _GEN_30; // @[Conditional.scala 39:67:@169.8]
  assign _GEN_34 = _T_111 ? funcReg : _GEN_27; // @[Conditional.scala 39:67:@169.8]
  assign _GEN_35 = _T_111 ? 1'h0 : _T_112; // @[Conditional.scala 39:67:@169.8]
  assign _GEN_36 = _T_111 ? _T_37 : _GEN_29; // @[Conditional.scala 39:67:@169.8]
  assign _GEN_37 = _T_111 ? exitReg : _GEN_31; // @[Conditional.scala 39:67:@169.8]
  assign _GEN_39 = _T_109 ? 3'h0 : _GEN_32; // @[Conditional.scala 39:67:@163.6]
  assign _GEN_41 = _T_109 ? funcReg : _GEN_34; // @[Conditional.scala 39:67:@163.6]
  assign _GEN_42 = _T_109 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67:@163.6]
  assign _GEN_43 = _T_109 ? _T_37 : _GEN_36; // @[Conditional.scala 39:67:@163.6]
  assign _GEN_44 = _T_109 ? exitReg : _GEN_37; // @[Conditional.scala 39:67:@163.6]
  assign _GEN_45 = _T_63 ? _GEN_22 : _GEN_39; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_46 = _T_63 ? _GEN_15 : _GEN_41; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_48 = _T_63 ? _GEN_16 : _GEN_42; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_52 = _T_63 ? _GEN_18 : 1'h0; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_53 = _T_63 ? _GEN_19 : outReg; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_54 = _T_63 ? _T_105 : 1'h0; // @[Conditional.scala 40:58:@94.4]
  assign _GEN_55 = _T_63 ? exitReg : _GEN_44; // @[Conditional.scala 40:58:@94.4]
  assign _T_123 = 3'h0 == funcReg; // @[Conditional.scala 37:30:@194.4]
  assign _T_124 = accuReg + mem_io_rdData; // @[Lipsi.scala 202:30:@196.6]
  assign _T_125 = _T_124[7:0]; // @[Lipsi.scala 202:30:@197.6]
  assign _T_126 = 3'h1 == funcReg; // @[Conditional.scala 37:30:@201.6]
  assign _T_127 = accuReg - mem_io_rdData; // @[Lipsi.scala 203:30:@203.8]
  assign _T_128 = $unsigned(_T_127); // @[Lipsi.scala 203:30:@204.8]
  assign _T_129 = _T_128[7:0]; // @[Lipsi.scala 203:30:@205.8]
  assign _T_130 = 3'h2 == funcReg; // @[Conditional.scala 37:30:@209.8]
  assign _T_133 = 3'h3 == funcReg; // @[Conditional.scala 37:30:@216.10]
  assign _T_137 = 3'h4 == funcReg; // @[Conditional.scala 37:30:@224.12]
  assign _T_138 = accuReg & mem_io_rdData; // @[Lipsi.scala 206:30:@226.14]
  assign _T_139 = 3'h5 == funcReg; // @[Conditional.scala 37:30:@230.14]
  assign _T_140 = accuReg | mem_io_rdData; // @[Lipsi.scala 207:29:@232.16]
  assign _T_141 = 3'h6 == funcReg; // @[Conditional.scala 37:30:@236.16]
  assign _T_142 = accuReg ^ mem_io_rdData; // @[Lipsi.scala 208:30:@238.18]
  assign _T_143 = 3'h7 == funcReg; // @[Conditional.scala 37:30:@242.18]
  assign _GEN_56 = _T_143 ? mem_io_rdData : 8'h0; // @[Conditional.scala 39:67:@243.18]
  assign _GEN_57 = _T_141 ? _T_142 : _GEN_56; // @[Conditional.scala 39:67:@237.16]
  assign _GEN_58 = _T_139 ? _T_140 : _GEN_57; // @[Conditional.scala 39:67:@231.14]
  assign _GEN_59 = _T_137 ? _T_138 : _GEN_58; // @[Conditional.scala 39:67:@225.12]
  assign _GEN_60 = _T_133 ? _T_129 : _GEN_59; // @[Conditional.scala 39:67:@217.10]
  assign _GEN_61 = _T_130 ? _T_125 : _GEN_60; // @[Conditional.scala 39:67:@210.8]
  assign _GEN_62 = _T_126 ? _T_129 : _GEN_61; // @[Conditional.scala 39:67:@202.6]
  assign res = _T_123 ? _T_125 : _GEN_62; // @[Conditional.scala 40:58:@195.4]
  assign _GEN_64 = enaAccuReg ? res : accuReg; // @[Lipsi.scala 211:20:@246.4]
  assign _GEN_65 = enaIoReg ? io_din : _GEN_64; // @[Lipsi.scala 214:18:@249.4]
  assign io_dout = outReg; // @[Lipsi.scala 218:11:@252.4]
  assign io_dbg_pc = pcReg; // @[Lipsi.scala 220:13:@254.4]
  assign io_dbg_accu = accuReg; // @[Lipsi.scala 219:15:@253.4]
  assign io_dbg_exit = exitReg; // @[Lipsi.scala 221:15:@255.4]
  assign mem_clock = clock; // @[:@46.4]
  assign mem_reset = reset; // @[:@47.4]
  assign mem_io_rdAddr = _T_63 ? _GEN_13 : _GEN_43; // @[Lipsi.scala 85:17:@54.4]
  assign mem_io_wrEna = _T_63 ? _T_76 : _T_109; // @[Lipsi.scala 88:16:@60.4]
  assign mem_io_wrData = accuReg; // @[Lipsi.scala 87:17:@59.4]
  assign mem_io_wrAddr = {1'h1,wrAddr}; // @[Lipsi.scala 86:17:@57.4]
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
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  exitReg = _RAND_8[0:0];
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
          pcReg <= _T_41;
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
          if (_T_123) begin
            accuReg <= _T_125;
          end else begin
            if (_T_126) begin
              accuReg <= _T_129;
            end else begin
              if (_T_130) begin
                accuReg <= _T_125;
              end else begin
                if (_T_133) begin
                  accuReg <= _T_129;
                end else begin
                  if (_T_137) begin
                    accuReg <= _T_138;
                  end else begin
                    if (_T_139) begin
                      accuReg <= _T_140;
                    end else begin
                      if (_T_141) begin
                        accuReg <= _T_142;
                      end else begin
                        if (_T_143) begin
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
      if (_T_63) begin
        if (_T_97) begin
          enaAccuReg <= 1'h1;
        end else begin
          enaAccuReg <= _T_67;
        end
      end else begin
        if (_T_109) begin
          enaAccuReg <= 1'h0;
        end else begin
          if (_T_111) begin
            enaAccuReg <= 1'h0;
          end else begin
            enaAccuReg <= _T_112;
          end
        end
      end
    end
    if (reset) begin
      enaPcReg <= 1'h0;
    end else begin
      if (_T_63) begin
        if (_T_102) begin
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
      if (_T_63) begin
        if (_T_97) begin
          funcReg <= _T_98;
        end else begin
          if (_T_67) begin
            funcReg <= _T_64;
          end else begin
            funcReg <= _T_64;
          end
        end
      end else begin
        if (!(_T_109)) begin
          if (!(_T_111)) begin
            if (_T_112) begin
              funcReg <= 3'h7;
            end
          end
        end
      end
    end
    if (reset) begin
      outReg <= 8'h0;
    end else begin
      if (_T_63) begin
        if (_T_105) begin
          outReg <= accuReg;
        end
      end
    end
    if (reset) begin
      enaIoReg <= 1'h0;
    end else begin
      if (_T_63) begin
        enaIoReg <= _T_105;
      end else begin
        enaIoReg <= 1'h0;
      end
    end
    if (reset) begin
      stateReg <= 3'h0;
    end else begin
      if (_T_63) begin
        if (_T_108) begin
          stateReg <= 3'h5;
        end else begin
          if (_T_105) begin
            stateReg <= 3'h0;
          end else begin
            if (_T_90) begin
              stateReg <= 3'h2;
            end else begin
              if (_T_83) begin
                stateReg <= 3'h3;
              end else begin
                if (_T_76) begin
                  stateReg <= 3'h0;
                end else begin
                  stateReg <= 3'h1;
                end
              end
            end
          end
        end
      end else begin
        if (_T_109) begin
          stateReg <= 3'h0;
        end else begin
          if (_T_111) begin
            stateReg <= 3'h0;
          end else begin
            if (_T_112) begin
              stateReg <= 3'h4;
            end else begin
              if (_T_118) begin
                stateReg <= 3'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      exitReg <= 1'h0;
    end else begin
      if (!(_T_63)) begin
        if (!(_T_109)) begin
          if (!(_T_111)) begin
            if (!(_T_112)) begin
              if (!(_T_118)) begin
                if (_T_119) begin
                  exitReg <= 1'h1;
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
module LipsiTop( // @[:@257.2]
  input        clock, // @[:@258.4]
  input        reset, // @[:@259.4]
  output [7:0] io_dout, // @[:@260.4]
  input  [7:0] io_din, // @[:@260.4]
  output [7:0] io_dbg_pc, // @[:@260.4]
  output [7:0] io_dbg_accu, // @[:@260.4]
  output       io_dbg_exit // @[:@260.4]
);
  wire  Lipsi_clock; // @[Lipsi.scala 258:23:@271.4]
  wire  Lipsi_reset; // @[Lipsi.scala 258:23:@271.4]
  wire [7:0] Lipsi_io_dout; // @[Lipsi.scala 258:23:@271.4]
  wire [7:0] Lipsi_io_din; // @[Lipsi.scala 258:23:@271.4]
  wire [7:0] Lipsi_io_dbg_pc; // @[Lipsi.scala 258:23:@271.4]
  wire [7:0] Lipsi_io_dbg_accu; // @[Lipsi.scala 258:23:@271.4]
  wire  Lipsi_io_dbg_exit; // @[Lipsi.scala 258:23:@271.4]
  reg  x; // @[Lipsi.scala 232:15:@263.4]
  reg [31:0] _RAND_0;
  reg  resetRegs; // @[Lipsi.scala 236:26:@269.4]
  reg [31:0] _RAND_1;
  Lipsi Lipsi ( // @[Lipsi.scala 258:23:@271.4]
    .clock(Lipsi_clock),
    .reset(Lipsi_reset),
    .io_dout(Lipsi_io_dout),
    .io_din(Lipsi_io_din),
    .io_dbg_pc(Lipsi_io_dbg_pc),
    .io_dbg_accu(Lipsi_io_dbg_accu),
    .io_dbg_exit(Lipsi_io_dbg_exit)
  );
  assign io_dout = Lipsi_io_dout; // @[Lipsi.scala 261:8:@279.4]
  assign io_dbg_pc = Lipsi_io_dbg_pc; // @[Lipsi.scala 261:8:@277.4]
  assign io_dbg_accu = Lipsi_io_dbg_accu; // @[Lipsi.scala 261:8:@276.4]
  assign io_dbg_exit = Lipsi_io_dbg_exit; // @[Lipsi.scala 261:8:@275.4]
  assign Lipsi_clock = clock; // @[:@272.4]
  assign Lipsi_reset = resetRegs; // @[:@273.4 Lipsi.scala 260:17:@274.4]
  assign Lipsi_io_din = io_din; // @[Lipsi.scala 261:8:@278.4]
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
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  x = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  resetRegs = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    x <= reset;
    resetRegs <= x == 1'h0;
  end
endmodule
