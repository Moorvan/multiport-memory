;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Memory : 
  module Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    wire _mem_WIRE : UInt<8>[16] @[Memory.scala 18:28]
    _mem_WIRE[0] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[1] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[2] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[3] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[4] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[5] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[6] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[7] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[8] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[9] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[10] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[11] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[12] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[13] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[14] <= UInt<8>("h00") @[Memory.scala 18:28]
    _mem_WIRE[15] <= UInt<8>("h00") @[Memory.scala 18:28]
    reg mem : UInt<8>[16], clock with : (reset => (reset, _mem_WIRE)) @[Memory.scala 18:20]
    reg wrDateReg : UInt, clock @[Memory.scala 20:26]
    wrDateReg <= io.wrData @[Memory.scala 20:26]
    node _doForwardReg_T = eq(io.wrAddr, io.rdAddr) @[Memory.scala 21:40]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io.wrEna) @[Memory.scala 21:54]
    reg doForwardReg : UInt<1>, clock @[Memory.scala 21:29]
    doForwardReg <= _doForwardReg_T_1 @[Memory.scala 21:29]
    when io.wrEna : @[Memory.scala 24:18]
      mem[io.wrAddr] <= io.wrData @[Memory.scala 25:20]
      skip @[Memory.scala 24:18]
    node _io_rdData_T = mux(doForwardReg, wrDateReg, mem[io.rdAddr]) @[Memory.scala 27:19]
    io.rdData <= _io_rdData_T @[Memory.scala 27:13]
    
