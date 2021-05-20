;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit XORMultiPortMemory : 
  module Memory : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module XORMultiPortMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wrAddr : UInt<10>[2], flip wrData : UInt<8>[2], flip wrEna : UInt<1>[2], flip rdAddr : UInt<10>[2], rdData : UInt<8>[2]}
    
    inst Memory of Memory @[XORMultiPortMemory.scala 20:11]
    Memory.clock <= clock
    Memory.reset <= reset
    inst Memory_1 of Memory_1 @[XORMultiPortMemory.scala 20:11]
    Memory_1.clock <= clock
    Memory_1.reset <= reset
    inst Memory_2 of Memory_2 @[XORMultiPortMemory.scala 23:11]
    Memory_2.clock <= clock
    Memory_2.reset <= reset
    inst Memory_3 of Memory_3 @[XORMultiPortMemory.scala 23:11]
    Memory_3.clock <= clock
    Memory_3.reset <= reset
    inst Memory_4 of Memory_4 @[XORMultiPortMemory.scala 23:11]
    Memory_4.clock <= clock
    Memory_4.reset <= reset
    inst Memory_5 of Memory_5 @[XORMultiPortMemory.scala 23:11]
    Memory_5.clock <= clock
    Memory_5.reset <= reset
    wire wrIn : UInt<8>[2] @[XORMultiPortMemory.scala 27:18]
    wire xors : UInt<8>[2] @[XORMultiPortMemory.scala 31:20]
    xors[0] <= io.wrData[0] @[XORMultiPortMemory.scala 32:13]
    Memory_1.io.rdAddr <= io.wrAddr[0] @[XORMultiPortMemory.scala 41:41]
    node _xors_1_T = xor(xors[0], Memory_1.io.rdData) @[XORMultiPortMemory.scala 42:36]
    xors[1] <= _xors_1_T @[XORMultiPortMemory.scala 42:19]
    wrIn[0] <= xors[1] @[XORMultiPortMemory.scala 46:13]
    wire xors_1 : UInt<8>[2] @[XORMultiPortMemory.scala 31:20]
    xors_1[0] <= io.wrData[1] @[XORMultiPortMemory.scala 32:13]
    Memory.io.rdAddr <= io.wrAddr[1] @[XORMultiPortMemory.scala 36:45]
    node _xors_1_T_1 = xor(xors_1[0], Memory.io.rdData) @[XORMultiPortMemory.scala 37:36]
    xors_1[1] <= _xors_1_T_1 @[XORMultiPortMemory.scala 37:19]
    wrIn[1] <= xors_1[1] @[XORMultiPortMemory.scala 46:13]
    Memory.io.wrEna <= io.wrEna[0] @[XORMultiPortMemory.scala 52:38]
    Memory.io.wrAddr <= io.wrAddr[0] @[XORMultiPortMemory.scala 53:39]
    Memory.io.wrData <= wrIn[0] @[XORMultiPortMemory.scala 54:39]
    Memory_1.io.wrEna <= io.wrEna[1] @[XORMultiPortMemory.scala 52:38]
    Memory_1.io.wrAddr <= io.wrAddr[1] @[XORMultiPortMemory.scala 53:39]
    Memory_1.io.wrData <= wrIn[1] @[XORMultiPortMemory.scala 54:39]
    Memory_2.io.wrEna <= io.wrEna[0] @[XORMultiPortMemory.scala 60:32]
    Memory_2.io.wrAddr <= io.wrAddr[0] @[XORMultiPortMemory.scala 61:33]
    Memory_2.io.wrData <= wrIn[0] @[XORMultiPortMemory.scala 62:33]
    Memory_2.io.rdAddr <= io.rdAddr[0] @[XORMultiPortMemory.scala 63:33]
    Memory_3.io.wrEna <= io.wrEna[0] @[XORMultiPortMemory.scala 60:32]
    Memory_3.io.wrAddr <= io.wrAddr[0] @[XORMultiPortMemory.scala 61:33]
    Memory_3.io.wrData <= wrIn[0] @[XORMultiPortMemory.scala 62:33]
    Memory_3.io.rdAddr <= io.rdAddr[1] @[XORMultiPortMemory.scala 63:33]
    Memory_4.io.wrEna <= io.wrEna[1] @[XORMultiPortMemory.scala 60:32]
    Memory_4.io.wrAddr <= io.wrAddr[1] @[XORMultiPortMemory.scala 61:33]
    Memory_4.io.wrData <= wrIn[1] @[XORMultiPortMemory.scala 62:33]
    Memory_4.io.rdAddr <= io.rdAddr[0] @[XORMultiPortMemory.scala 63:33]
    Memory_5.io.wrEna <= io.wrEna[1] @[XORMultiPortMemory.scala 60:32]
    Memory_5.io.wrAddr <= io.wrAddr[1] @[XORMultiPortMemory.scala 61:33]
    Memory_5.io.wrData <= wrIn[1] @[XORMultiPortMemory.scala 62:33]
    Memory_5.io.rdAddr <= io.rdAddr[1] @[XORMultiPortMemory.scala 63:33]
    wire xors_2 : UInt<8>[2] @[XORMultiPortMemory.scala 69:20]
    xors_2[0] <= Memory_2.io.rdData @[XORMultiPortMemory.scala 70:13]
    node _xors_1_T_2 = xor(xors_2[0], Memory_4.io.rdData) @[XORMultiPortMemory.scala 72:30]
    xors_2[1] <= _xors_1_T_2 @[XORMultiPortMemory.scala 72:15]
    io.rdData[0] <= xors_2[1] @[XORMultiPortMemory.scala 74:18]
    wire xors_3 : UInt<8>[2] @[XORMultiPortMemory.scala 69:20]
    xors_3[0] <= Memory_3.io.rdData @[XORMultiPortMemory.scala 70:13]
    node _xors_1_T_3 = xor(xors_3[0], Memory_5.io.rdData) @[XORMultiPortMemory.scala 72:30]
    xors_3[1] <= _xors_1_T_3 @[XORMultiPortMemory.scala 72:15]
    io.rdData[1] <= xors_3[1] @[XORMultiPortMemory.scala 74:18]
    
