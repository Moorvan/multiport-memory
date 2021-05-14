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
      reader => memData
      writer => MPORT
      read-under-write => undefined
    reg wrDateReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDateReg) @[Memory.scala 18:26]
    node _doForwardReg_T = eq(io_wrAddr, io_rdAddr) @[Memory.scala 19:40]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_wrEna) @[Memory.scala 19:54]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[Memory.scala 19:29]
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Memory.scala 22:18]
    node _GEN_1 = validif(io_wrEna, clock) @[Memory.scala 22:18]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Memory.scala 22:18 Memory.scala 16:24]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Memory.scala 22:18]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Memory.scala 22:18]
    node _io_rdData_T = mux(doForwardReg, wrDateReg, mem.memData.data) @[Memory.scala 25:19]
    io_rdData <= _io_rdData_T @[Memory.scala 25:13]
    mem.memData.addr <= io_rdAddr @[Memory.scala 20:25]
    mem.memData.en <= UInt<1>("h1") @[Memory.scala 20:25]
    mem.memData.clk <= clock @[Memory.scala 20:25]
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3
    wrDateReg <= io_wrData @[Memory.scala 18:26]
    doForwardReg <= _doForwardReg_T_1 @[Memory.scala 19:29]

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

    inst Memory of Memory @[XORMultiPortMemory.scala 19:11]
    inst Memory_1 of Memory @[XORMultiPortMemory.scala 19:11]
    inst Memory_2 of Memory @[XORMultiPortMemory.scala 22:11]
    inst Memory_3 of Memory @[XORMultiPortMemory.scala 22:11]
    inst Memory_4 of Memory @[XORMultiPortMemory.scala 22:11]
    inst Memory_5 of Memory @[XORMultiPortMemory.scala 22:11]
    node xors__0 = io_wrData_0 @[XORMultiPortMemory.scala 30:20 XORMultiPortMemory.scala 31:13]
    node _xors_1_T = xor(xors__0, Memory_1.io_rdData) @[XORMultiPortMemory.scala 41:36]
    node xors_1_0 = io_wrData_1 @[XORMultiPortMemory.scala 30:20 XORMultiPortMemory.scala 31:13]
    node _xors_1_T_1 = xor(xors_1_0, Memory.io_rdData) @[XORMultiPortMemory.scala 36:36]
    node xors_2_0 = Memory_2.io_rdData @[XORMultiPortMemory.scala 68:20 XORMultiPortMemory.scala 69:13]
    node _xors_1_T_2 = xor(xors_2_0, Memory_4.io_rdData) @[XORMultiPortMemory.scala 71:30]
    node xors_3_0 = Memory_3.io_rdData @[XORMultiPortMemory.scala 68:20 XORMultiPortMemory.scala 69:13]
    node _xors_1_T_3 = xor(xors_3_0, Memory_5.io_rdData) @[XORMultiPortMemory.scala 71:30]
    node xors__1 = _xors_1_T @[XORMultiPortMemory.scala 30:20 XORMultiPortMemory.scala 41:19]
    node wrIn_0 = xors__1 @[XORMultiPortMemory.scala 26:18 XORMultiPortMemory.scala 45:13]
    node xors_1_1 = _xors_1_T_1 @[XORMultiPortMemory.scala 30:20 XORMultiPortMemory.scala 36:19]
    node wrIn_1 = xors_1_1 @[XORMultiPortMemory.scala 26:18 XORMultiPortMemory.scala 45:13]
    node xors_2_1 = _xors_1_T_2 @[XORMultiPortMemory.scala 68:20 XORMultiPortMemory.scala 71:15]
    node xors_3_1 = _xors_1_T_3 @[XORMultiPortMemory.scala 68:20 XORMultiPortMemory.scala 71:15]
    io_rdData_0 <= xors_2_1 @[XORMultiPortMemory.scala 73:18]
    io_rdData_1 <= xors_3_1 @[XORMultiPortMemory.scala 73:18]
    Memory.clock <= clock
    Memory.reset <= reset
    Memory.io_rdAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 35:45]
    Memory.io_wrEna <= io_wrEna_0 @[XORMultiPortMemory.scala 51:38]
    Memory.io_wrData <= wrIn_0 @[XORMultiPortMemory.scala 53:39]
    Memory.io_wrAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 52:39]
    Memory_1.clock <= clock
    Memory_1.reset <= reset
    Memory_1.io_rdAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 40:41]
    Memory_1.io_wrEna <= io_wrEna_1 @[XORMultiPortMemory.scala 51:38]
    Memory_1.io_wrData <= wrIn_1 @[XORMultiPortMemory.scala 53:39]
    Memory_1.io_wrAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 52:39]
    Memory_2.clock <= clock
    Memory_2.reset <= reset
    Memory_2.io_rdAddr <= io_rdAddr_0 @[XORMultiPortMemory.scala 62:33]
    Memory_2.io_wrEna <= io_wrEna_0 @[XORMultiPortMemory.scala 59:32]
    Memory_2.io_wrData <= wrIn_0 @[XORMultiPortMemory.scala 61:33]
    Memory_2.io_wrAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 60:33]
    Memory_3.clock <= clock
    Memory_3.reset <= reset
    Memory_3.io_rdAddr <= io_rdAddr_1 @[XORMultiPortMemory.scala 62:33]
    Memory_3.io_wrEna <= io_wrEna_0 @[XORMultiPortMemory.scala 59:32]
    Memory_3.io_wrData <= wrIn_0 @[XORMultiPortMemory.scala 61:33]
    Memory_3.io_wrAddr <= io_wrAddr_0 @[XORMultiPortMemory.scala 60:33]
    Memory_4.clock <= clock
    Memory_4.reset <= reset
    Memory_4.io_rdAddr <= io_rdAddr_0 @[XORMultiPortMemory.scala 62:33]
    Memory_4.io_wrEna <= io_wrEna_1 @[XORMultiPortMemory.scala 59:32]
    Memory_4.io_wrData <= wrIn_1 @[XORMultiPortMemory.scala 61:33]
    Memory_4.io_wrAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 60:33]
    Memory_5.clock <= clock
    Memory_5.reset <= reset
    Memory_5.io_rdAddr <= io_rdAddr_1 @[XORMultiPortMemory.scala 62:33]
    Memory_5.io_wrEna <= io_wrEna_1 @[XORMultiPortMemory.scala 59:32]
    Memory_5.io_wrData <= wrIn_1 @[XORMultiPortMemory.scala 61:33]
    Memory_5.io_wrAddr <= io_wrAddr_1 @[XORMultiPortMemory.scala 60:33]
