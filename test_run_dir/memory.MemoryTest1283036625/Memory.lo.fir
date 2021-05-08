circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<4>
    output io_rdData : UInt<8>
    input io_wrEna : UInt<1>
    input io_wrData : UInt<8>
    input io_wrAddr : UInt<4>

    mem mem : @[Memory.scala 18:24]
      data-type => UInt<8>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => memData
      writer => MPORT
      read-under-write => undefined
    reg wrDateReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDateReg) @[Memory.scala 20:26]
    node _doForwardReg_T = eq(io_wrAddr, io_rdAddr) @[Memory.scala 21:40]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_wrEna) @[Memory.scala 21:54]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[Memory.scala 21:29]
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Memory.scala 24:18]
    node _GEN_1 = validif(io_wrEna, clock) @[Memory.scala 24:18]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Memory.scala 24:18 Memory.scala 18:24]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Memory.scala 24:18]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Memory.scala 24:18]
    node _io_rdData_T = mux(doForwardReg, wrDateReg, mem.memData.data) @[Memory.scala 27:19]
    io_rdData <= _io_rdData_T @[Memory.scala 27:13]
    mem.memData.addr <= io_rdAddr @[Memory.scala 22:25]
    mem.memData.en <= UInt<1>("h1") @[Memory.scala 22:25]
    mem.memData.clk <= clock @[Memory.scala 22:25]
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3
    wrDateReg <= io_wrData @[Memory.scala 20:26]
    doForwardReg <= _doForwardReg_T_1 @[Memory.scala 21:29]
