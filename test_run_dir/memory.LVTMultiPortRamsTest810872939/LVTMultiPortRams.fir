;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit LVTMultiPortRams : 
  module Memory : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module Memory_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}
    
    smem mem : UInt<8>[16], undefined @[Memory.scala 16:24]
    when io.wrEna : @[Memory.scala 22:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 22:18]
    read mport io_rdData_MPORT = mem[io.rdAddr], clock @[Memory.scala 26:24]
    io.rdData <= io_rdData_MPORT @[Memory.scala 26:13]
    
  module LiveValueTable : 
    input clock : Clock
    input reset : Reset
    output io : {flip wrAddr : UInt<4>[2], flip wrEna : UInt<1>[2], flip rdAddr : UInt<4>[2], rdIdx : UInt<2>[2]}
    
    wire _lvtReg_WIRE : UInt<2>[16] @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[0] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[1] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[2] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[3] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[4] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[5] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[6] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[7] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[8] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[9] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[10] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[11] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[12] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[13] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[14] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    _lvtReg_WIRE[15] <= UInt<2>("h00") @[LVTMultiPortRams.scala 28:31]
    reg lvtReg : UInt<2>[16], clock with : (reset => (reset, _lvtReg_WIRE)) @[LVTMultiPortRams.scala 28:23]
    node _T = eq(io.wrEna[0], UInt<1>("h01")) @[LVTMultiPortRams.scala 31:22]
    when _T : @[LVTMultiPortRams.scala 31:34]
      lvtReg[io.wrAddr[0]] <= UInt<1>("h00") @[LVTMultiPortRams.scala 32:28]
      skip @[LVTMultiPortRams.scala 31:34]
    node _T_1 = eq(io.wrEna[1], UInt<1>("h01")) @[LVTMultiPortRams.scala 31:22]
    when _T_1 : @[LVTMultiPortRams.scala 31:34]
      lvtReg[io.wrAddr[1]] <= UInt<1>("h01") @[LVTMultiPortRams.scala 32:28]
      skip @[LVTMultiPortRams.scala 31:34]
    io.rdIdx[0] <= lvtReg[io.rdAddr[0]] @[LVTMultiPortRams.scala 37:17]
    io.rdIdx[1] <= lvtReg[io.rdAddr[1]] @[LVTMultiPortRams.scala 37:17]
    
  module LVTMultiPortRams : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wrAddr : UInt<4>[2], flip wrData : UInt<8>[2], flip wrEna : UInt<1>[2], flip rdAddr : UInt<4>[2], rdData : UInt<8>[2]}
    
    inst Memory of Memory @[LVTMultiPortRams.scala 52:44]
    Memory.clock <= clock
    Memory.reset <= reset
    inst Memory_1 of Memory_1 @[LVTMultiPortRams.scala 52:44]
    Memory_1.clock <= clock
    Memory_1.reset <= reset
    inst Memory_2 of Memory_2 @[LVTMultiPortRams.scala 52:44]
    Memory_2.clock <= clock
    Memory_2.reset <= reset
    inst Memory_3 of Memory_3 @[LVTMultiPortRams.scala 52:44]
    Memory_3.clock <= clock
    Memory_3.reset <= reset
    wire mems : {flip rdAddr : UInt<4>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<4>}[4] @[LVTMultiPortRams.scala 52:21]
    Memory.io.wrAddr <= mems[0].wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory.io.wrData <= mems[0].wrData @[LVTMultiPortRams.scala 52:21]
    Memory.io.wrEna <= mems[0].wrEna @[LVTMultiPortRams.scala 52:21]
    mems[0].rdData <= Memory.io.rdData @[LVTMultiPortRams.scala 52:21]
    Memory.io.rdAddr <= mems[0].rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory_1.io.wrAddr <= mems[1].wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory_1.io.wrData <= mems[1].wrData @[LVTMultiPortRams.scala 52:21]
    Memory_1.io.wrEna <= mems[1].wrEna @[LVTMultiPortRams.scala 52:21]
    mems[1].rdData <= Memory_1.io.rdData @[LVTMultiPortRams.scala 52:21]
    Memory_1.io.rdAddr <= mems[1].rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory_2.io.wrAddr <= mems[2].wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory_2.io.wrData <= mems[2].wrData @[LVTMultiPortRams.scala 52:21]
    Memory_2.io.wrEna <= mems[2].wrEna @[LVTMultiPortRams.scala 52:21]
    mems[2].rdData <= Memory_2.io.rdData @[LVTMultiPortRams.scala 52:21]
    Memory_2.io.rdAddr <= mems[2].rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory_3.io.wrAddr <= mems[3].wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory_3.io.wrData <= mems[3].wrData @[LVTMultiPortRams.scala 52:21]
    Memory_3.io.wrEna <= mems[3].wrEna @[LVTMultiPortRams.scala 52:21]
    mems[3].rdData <= Memory_3.io.rdData @[LVTMultiPortRams.scala 52:21]
    Memory_3.io.rdAddr <= mems[3].rdAddr @[LVTMultiPortRams.scala 52:21]
    inst lvt of LiveValueTable @[LVTMultiPortRams.scala 53:19]
    lvt.clock <= clock
    lvt.reset <= reset
    mems[0].wrEna <= io.wrEna[0] @[LVTMultiPortRams.scala 57:29]
    mems[0].wrAddr <= io.wrAddr[0] @[LVTMultiPortRams.scala 58:30]
    mems[0].wrData <= io.wrData[0] @[LVTMultiPortRams.scala 59:30]
    mems[0].rdAddr <= io.rdAddr[0] @[LVTMultiPortRams.scala 60:30]
    mems[1].wrEna <= io.wrEna[0] @[LVTMultiPortRams.scala 57:29]
    mems[1].wrAddr <= io.wrAddr[0] @[LVTMultiPortRams.scala 58:30]
    mems[1].wrData <= io.wrData[0] @[LVTMultiPortRams.scala 59:30]
    mems[1].rdAddr <= io.rdAddr[1] @[LVTMultiPortRams.scala 60:30]
    mems[2].wrEna <= io.wrEna[1] @[LVTMultiPortRams.scala 57:29]
    mems[2].wrAddr <= io.wrAddr[1] @[LVTMultiPortRams.scala 58:30]
    mems[2].wrData <= io.wrData[1] @[LVTMultiPortRams.scala 59:30]
    mems[2].rdAddr <= io.rdAddr[0] @[LVTMultiPortRams.scala 60:30]
    mems[3].wrEna <= io.wrEna[1] @[LVTMultiPortRams.scala 57:29]
    mems[3].wrAddr <= io.wrAddr[1] @[LVTMultiPortRams.scala 58:30]
    mems[3].wrData <= io.wrData[1] @[LVTMultiPortRams.scala 59:30]
    mems[3].rdAddr <= io.rdAddr[1] @[LVTMultiPortRams.scala 60:30]
    lvt.io.wrEna[0] <= io.wrEna[0] @[LVTMultiPortRams.scala 64:21]
    lvt.io.wrAddr[0] <= io.wrAddr[0] @[LVTMultiPortRams.scala 65:22]
    lvt.io.wrEna[1] <= io.wrEna[1] @[LVTMultiPortRams.scala 64:21]
    lvt.io.wrAddr[1] <= io.wrAddr[1] @[LVTMultiPortRams.scala 65:22]
    lvt.io.rdAddr[0] <= io.rdAddr[0] @[LVTMultiPortRams.scala 68:22]
    lvt.io.rdAddr[1] <= io.rdAddr[1] @[LVTMultiPortRams.scala 68:22]
    node _io_rdData_0_T = mul(lvt.io.rdIdx[0], UInt<2>("h02")) @[LVTMultiPortRams.scala 72:30]
    node _io_rdData_0_T_1 = add(_io_rdData_0_T, UInt<1>("h00")) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_0_T_2 = tail(_io_rdData_0_T_1, 1) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_0_T_3 = bits(_io_rdData_0_T_2, 1, 0)
    io.rdData[0] <= mems[_io_rdData_0_T_3].rdData @[LVTMultiPortRams.scala 72:18]
    node _io_rdData_1_T = mul(lvt.io.rdIdx[1], UInt<2>("h02")) @[LVTMultiPortRams.scala 72:30]
    node _io_rdData_1_T_1 = add(_io_rdData_1_T, UInt<1>("h01")) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_1_T_2 = tail(_io_rdData_1_T_1, 1) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_1_T_3 = bits(_io_rdData_1_T_2, 1, 0)
    io.rdData[1] <= mems[_io_rdData_1_T_3].rdData @[LVTMultiPortRams.scala 72:18]
    
