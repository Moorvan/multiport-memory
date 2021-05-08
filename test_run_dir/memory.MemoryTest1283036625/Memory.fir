;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Memory : 
  module Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16], undefined @[Memory.scala 18:24]
    reg wrDateReg : UInt, clock @[Memory.scala 20:26]
    wrDateReg <= io.wrData @[Memory.scala 20:26]
    node _doForwardReg_T = eq(io.wrAddr, io.rdAddr) @[Memory.scala 21:40]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io.wrEna) @[Memory.scala 21:54]
    reg doForwardReg : UInt<1>, clock @[Memory.scala 21:29]
    doForwardReg <= _doForwardReg_T_1 @[Memory.scala 21:29]
    read mport memData = mem[io.rdAddr], clock @[Memory.scala 22:25]
    when io.wrEna : @[Memory.scala 24:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 24:18]
    node _io_rdData_T = mux(doForwardReg, wrDateReg, memData) @[Memory.scala 27:19]
    io.rdData <= _io_rdData_T @[Memory.scala 27:13]
    
