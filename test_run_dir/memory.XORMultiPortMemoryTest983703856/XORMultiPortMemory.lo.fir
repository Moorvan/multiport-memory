circuit XORMultiPortMemory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<10>
    output io_rdData : UInt<8>
    input io_wrEna : UInt<1>
    input io_wrData : UInt<8>
    input io_wrAddr : UInt<10>

    mem mem : @[Memory.scala 16:24]
      data-type => UInt<8>
      depth => 1024
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

  module XORMultiPortMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_wrAddr_0 : UInt<10>
    input io_wrAddr_1 : UInt<10>
    input io_wrData_0 : UInt<8>
    input io_wrData_1 : UInt<8>
    input io_wrEna_0 : UInt<1>
    input io_wrEna_1 : UInt<1>
    input io_rdAddr_0 : UInt<10>
    input io_rdAddr_1 : UInt<10>
    output io_rdData_0 : UInt<8>
    output io_rdData_1 : UInt<8>

    inst Memory of Memory @[XORMultiPortMemory.scala 20:11]
    inst Memory_1 of Memory @[XORMultiPortMemory.scala 20:11]
    inst Memory_2 of Memory @[XORMultiPortMemory.scala 23:11]
    inst Memory_3 of Memory @[XORMultiPortMemory.scala 23:11]
    inst Memory_4 of Memory @[XORMultiPortMemory.scala 23:11]
    inst Memory_5 of Memory @[XORMultiPortMemory.scala 23:11]
    node xors__0 = io_wrData_0 @[XORMultiPortMemory.scala 31:20 XORMultiPortMemory.scala 32:13]
    node _xors_1_T = xor(xors__0, Memory_1.io_rdData) @[XORMultiPortMemory.scala 42:36]
    node xors_1_0 = io_wrData_1 @[XORMultiPortMemory.scala 31:20 XORMultiPortMemory.scala 32:13]
    node _xors_1_T_1 = xor(xors_1_0, Memory.io_rdData) @[XORMultiPortMemory.scala 37:36]
    node xors_2_0 = Memory_2.io_rdData @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
    node _xors_1_T_2 = xor(xors_2_0, Memory_4.io_rdData) @[XORMultiPortMemory.scala 72:30]
    node xors_3_0 = Memory_3.io_rdData @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
    node _xors_1_T_3 = xor(xors_3_0, Memory_5.io_rdData) @[XORMultiPortMemory.scala 72:30]
    node xors__1 = _xors_1_T @[XORMultiPortMemory.scala 31:20 XORMultiPortMemory.scala 42:19]
    node wrIn_0 = xors__1 @[XORMultiPortMemory.scala 27:18 XORMultiPortMemory.scala 46:13]
    node xors_1_1 = _xors_1_T_1 @[XORMultiPortMemory.scala 31:20 XORMultiPortMemory.scala 37:19]
    node wrIn_1 = xors_1_1 @[XORMultiPortMemory.scala 27:18 XORMultiPortMemory.scala 46:13]
    node xors_2_1 = _xors_1_T_2 @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 72:15]
    node xors_3_1 = _xors_1_T_3 @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 72:15]
    io_rdData_0 <= xors_2_1 @[XORMultiPortMemory.scala 74:18]
    io_rdData_1 <= xors_3_1 @[XORMultiPortMemory.scala 74:18]
    Memory.clock <= clock
    Memory.reset <= reset
    Memory.io_rdAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 36:45]
    Memory.io_wrEna <= io_wrEna_0 @[XORMultiPortMemory.scala 52:38]
    Memory.io_wrData <= wrIn_0 @[XORMultiPortMemory.scala 54:39]
    Memory.io_wrAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 53:39]
    Memory_1.clock <= clock
    Memory_1.reset <= reset
    Memory_1.io_rdAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 41:41]
    Memory_1.io_wrEna <= io_wrEna_1 @[XORMultiPortMemory.scala 52:38]
    Memory_1.io_wrData <= wrIn_1 @[XORMultiPortMemory.scala 54:39]
    Memory_1.io_wrAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 53:39]
    Memory_2.clock <= clock
    Memory_2.reset <= reset
    Memory_2.io_rdAddr <= io_rdAddr_0 @[XORMultiPortMemory.scala 63:33]
    Memory_2.io_wrEna <= io_wrEna_0 @[XORMultiPortMemory.scala 60:32]
    Memory_2.io_wrData <= wrIn_0 @[XORMultiPortMemory.scala 62:33]
    Memory_2.io_wrAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 61:33]
    Memory_3.clock <= clock
    Memory_3.reset <= reset
    Memory_3.io_rdAddr <= io_rdAddr_1 @[XORMultiPortMemory.scala 63:33]
    Memory_3.io_wrEna <= io_wrEna_0 @[XORMultiPortMemory.scala 60:32]
    Memory_3.io_wrData <= wrIn_0 @[XORMultiPortMemory.scala 62:33]
    Memory_3.io_wrAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 61:33]
    Memory_4.clock <= clock
    Memory_4.reset <= reset
    Memory_4.io_rdAddr <= io_rdAddr_0 @[XORMultiPortMemory.scala 63:33]
    Memory_4.io_wrEna <= io_wrEna_1 @[XORMultiPortMemory.scala 60:32]
    Memory_4.io_wrData <= wrIn_1 @[XORMultiPortMemory.scala 62:33]
    Memory_4.io_wrAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 61:33]
    Memory_5.clock <= clock
    Memory_5.reset <= reset
    Memory_5.io_rdAddr <= io_rdAddr_1 @[XORMultiPortMemory.scala 63:33]
    Memory_5.io_wrEna <= io_wrEna_1 @[XORMultiPortMemory.scala 60:32]
    Memory_5.io_wrData <= wrIn_1 @[XORMultiPortMemory.scala 62:33]
    Memory_5.io_wrAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 61:33]
