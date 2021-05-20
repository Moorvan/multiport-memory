;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Memory : 
  module Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
