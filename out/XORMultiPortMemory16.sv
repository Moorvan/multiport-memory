module Memory(
  input        clock,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [3:0] io_wrAddr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:15]; // @[Memory.scala 16:24]
  wire [7:0] mem_io_rdData_MPORT_data; // @[Memory.scala 16:24]
  wire [3:0] mem_io_rdData_MPORT_addr; // @[Memory.scala 16:24]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 16:24]
  wire [3:0] mem_MPORT_addr; // @[Memory.scala 16:24]
  wire  mem_MPORT_mask; // @[Memory.scala 16:24]
  wire  mem_MPORT_en; // @[Memory.scala 16:24]
  reg [3:0] mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_addr = mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_data = mem[mem_io_rdData_MPORT_addr]; // @[Memory.scala 16:24]
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = io_wrAddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_rdData = mem_io_rdData_MPORT_data; // @[Memory.scala 26:13]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 16:24]
    end
    mem_io_rdData_MPORT_addr_pipe_0 <= io_rdAddr;
  end
// Register and memory initialization
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdData_MPORT_addr_pipe_0 = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module XORMultiPortMemory(
  input        clock,
  input        reset,
  input  [3:0] io_wrAddr_0,
  input  [3:0] io_wrAddr_1,
  input  [7:0] io_wrData_0,
  input  [7:0] io_wrData_1,
  input        io_wrEna_0,
  input        io_wrEna_1,
  input  [3:0] io_rdAddr_0,
  input  [3:0] io_rdAddr_1,
  output [7:0] io_rdData_0,
  output [7:0] io_rdData_1
);
  wire  Memory_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_1_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_1_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_1_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_1_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_1_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_1_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_2_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_2_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_2_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_2_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_2_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_2_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_3_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_3_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_3_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_3_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_3_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_3_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_4_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_4_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_4_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_4_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_4_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_4_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_5_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_5_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_5_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_5_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_5_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_5_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] xors_2_0 = Memory_2_io_rdData; // @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
  wire [7:0] xors_3_0 = Memory_3_io_rdData; // @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
  Memory Memory ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_clock),
    .io_rdAddr(Memory_io_rdAddr),
    .io_rdData(Memory_io_rdData),
    .io_wrEna(Memory_io_wrEna),
    .io_wrData(Memory_io_wrData),
    .io_wrAddr(Memory_io_wrAddr)
  );
  Memory Memory_1 ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_1_clock),
    .io_rdAddr(Memory_1_io_rdAddr),
    .io_rdData(Memory_1_io_rdData),
    .io_wrEna(Memory_1_io_wrEna),
    .io_wrData(Memory_1_io_wrData),
    .io_wrAddr(Memory_1_io_wrAddr)
  );
  Memory Memory_2 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_2_clock),
    .io_rdAddr(Memory_2_io_rdAddr),
    .io_rdData(Memory_2_io_rdData),
    .io_wrEna(Memory_2_io_wrEna),
    .io_wrData(Memory_2_io_wrData),
    .io_wrAddr(Memory_2_io_wrAddr)
  );
  Memory Memory_3 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_3_clock),
    .io_rdAddr(Memory_3_io_rdAddr),
    .io_rdData(Memory_3_io_rdData),
    .io_wrEna(Memory_3_io_wrEna),
    .io_wrData(Memory_3_io_wrData),
    .io_wrAddr(Memory_3_io_wrAddr)
  );
  Memory Memory_4 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_4_clock),
    .io_rdAddr(Memory_4_io_rdAddr),
    .io_rdData(Memory_4_io_rdData),
    .io_wrEna(Memory_4_io_wrEna),
    .io_wrData(Memory_4_io_wrData),
    .io_wrAddr(Memory_4_io_wrAddr)
  );
  Memory Memory_5 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_5_clock),
    .io_rdAddr(Memory_5_io_rdAddr),
    .io_rdData(Memory_5_io_rdData),
    .io_wrEna(Memory_5_io_wrEna),
    .io_wrData(Memory_5_io_wrData),
    .io_wrAddr(Memory_5_io_wrAddr)
  );
  assign io_rdData_0 = xors_2_0 ^ Memory_4_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  assign io_rdData_1 = xors_3_0 ^ Memory_5_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  assign Memory_clock = clock;
  assign Memory_io_rdAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 36:45]
  assign Memory_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_io_wrData = io_wrData_0 ^ Memory_1_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_1_clock = clock;
  assign Memory_1_io_rdAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 41:41]
  assign Memory_1_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_1_io_wrData = io_wrData_1 ^ Memory_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_1_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_2_clock = clock;
  assign Memory_2_io_rdAddr = io_rdAddr_0; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_2_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_2_io_wrData = io_wrData_0 ^ Memory_1_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_2_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_3_clock = clock;
  assign Memory_3_io_rdAddr = io_rdAddr_1; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_3_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_3_io_wrData = io_wrData_0 ^ Memory_1_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_3_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_4_clock = clock;
  assign Memory_4_io_rdAddr = io_rdAddr_0; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_4_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_4_io_wrData = io_wrData_1 ^ Memory_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_4_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_5_clock = clock;
  assign Memory_5_io_rdAddr = io_rdAddr_1; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_5_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_5_io_wrData = io_wrData_1 ^ Memory_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_5_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 61:33]
endmodule
