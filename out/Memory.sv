module Memory(
  input        clock,
  input        reset,
  input  [5:0] io_rdAddr,
  output [7:0] io_rdData,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [5:0] io_wrAddr
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:99]; // @[Memory.scala 18:24]
  wire [7:0] mem_memData_data; // @[Memory.scala 18:24]
  wire [6:0] mem_memData_addr; // @[Memory.scala 18:24]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 18:24]
  wire [6:0] mem_MPORT_addr; // @[Memory.scala 18:24]
  wire  mem_MPORT_mask; // @[Memory.scala 18:24]
  wire  mem_MPORT_en; // @[Memory.scala 18:24]
  reg [6:0] mem_memData_addr_pipe_0;
  reg [7:0] wrDateReg; // @[Memory.scala 20:26]
  reg  doForwardReg; // @[Memory.scala 21:29]
  assign mem_memData_addr = mem_memData_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_memData_data = mem[mem_memData_addr]; // @[Memory.scala 18:24]
  `else
  assign mem_memData_data = mem_memData_addr >= 7'h64 ? _RAND_1[7:0] : mem[mem_memData_addr]; // @[Memory.scala 18:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = {{1'd0}, io_wrAddr};
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_rdData = doForwardReg ? wrDateReg : mem_memData_data; // @[Memory.scala 27:19]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 18:24]
    end
    mem_memData_addr_pipe_0 <= {{1'd0}, io_rdAddr};
    wrDateReg <= io_wrData; // @[Memory.scala 20:26]
    doForwardReg <= io_wrAddr == io_rdAddr & io_wrEna; // @[Memory.scala 21:54]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 100; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem_memData_addr_pipe_0 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  wrDateReg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  doForwardReg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
