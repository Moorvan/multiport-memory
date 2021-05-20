circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<4>
    output io_rdData : UInt<8>
    input io_wrEna : UInt<1>
    input io_wrData : UInt<8>
    input io_wrAddr : UInt<4>

    mem mem : @[Memory.scala 16:24]
      data-type => UInt<8>
      depth => 16
      read-latency => 1
      write-latency => 1
      reader => io_rdData_MPORT
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Memory.scala 22:18]
    node _GEN_1 = validif(io_wrEna, clock) @[Memory.scala 22:18]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Memory.scala 22:18 Memory.scala 16:24]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Memory.scala 22:18]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Memory.scala 22:18]
    io_rdData <= mem.io_rdData_MPORT.data @[Memory.scala 26:13]
    mem.io_rdData_MPORT.addr <= io_rdAddr @[Memory.scala 26:24]
    mem.io_rdData_MPORT.en <= UInt<1>("h1") @[Memory.scala 26:24]
    mem.io_rdData_MPORT.clk <= clock @[Memory.scala 26:24]
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3
