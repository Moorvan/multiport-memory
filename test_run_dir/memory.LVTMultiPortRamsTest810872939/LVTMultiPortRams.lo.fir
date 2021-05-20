circuit LVTMultiPortRams :
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

  module LiveValueTable :
    input clock : Clock
    input reset : UInt<1>
    input io_wrAddr_0 : UInt<4>
    input io_wrAddr_1 : UInt<4>
    input io_wrEna_0 : UInt<1>
    input io_wrEna_1 : UInt<1>
    input io_rdAddr_0 : UInt<4>
    input io_rdAddr_1 : UInt<4>
    output io_rdIdx_0 : UInt<2>
    output io_rdIdx_1 : UInt<2>

    reg lvtReg_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_0) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_1) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_2) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_3) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_4 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_4) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_5 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_5) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_6 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_6) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_7 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_7) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_8 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_8) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_9 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_9) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_10 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_10) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_11 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_11) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_12 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_12) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_13 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_13) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_14 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_14) @[LVTMultiPortRams.scala 28:23]
    reg lvtReg_15 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lvtReg_15) @[LVTMultiPortRams.scala 28:23]
    node _T = eq(io_wrEna_0, UInt<1>("h1")) @[LVTMultiPortRams.scala 31:22]
    node _lvtReg_io_wrAddr_0 = pad(UInt<1>("h0"), 2) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_0) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_1) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_2) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_3) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_4) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_5) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_6) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_7) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_8) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_9) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_10) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_11) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_12) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_13) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_14) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_wrAddr_0), _lvtReg_io_wrAddr_0, lvtReg_15) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
    node _GEN_16 = mux(_T, _GEN_0, lvtReg_0) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_17 = mux(_T, _GEN_1, lvtReg_1) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_18 = mux(_T, _GEN_2, lvtReg_2) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_19 = mux(_T, _GEN_3, lvtReg_3) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_20 = mux(_T, _GEN_4, lvtReg_4) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_21 = mux(_T, _GEN_5, lvtReg_5) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_22 = mux(_T, _GEN_6, lvtReg_6) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_23 = mux(_T, _GEN_7, lvtReg_7) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_24 = mux(_T, _GEN_8, lvtReg_8) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_25 = mux(_T, _GEN_9, lvtReg_9) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_26 = mux(_T, _GEN_10, lvtReg_10) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_27 = mux(_T, _GEN_11, lvtReg_11) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_28 = mux(_T, _GEN_12, lvtReg_12) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_29 = mux(_T, _GEN_13, lvtReg_13) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_30 = mux(_T, _GEN_14, lvtReg_14) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _GEN_31 = mux(_T, _GEN_15, lvtReg_15) @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
    node _T_1 = eq(io_wrEna_1, UInt<1>("h1")) @[LVTMultiPortRams.scala 31:22]
    node _lvtReg_io_wrAddr_1 = pad(UInt<1>("h1"), 2) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_32 = mux(eq(UInt<1>("h0"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_16) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_17) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_18) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_19) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_20) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_21) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_22) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_23) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_24) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_25) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_26) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_27) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_28) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_29) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_30) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_wrAddr_1), _lvtReg_io_wrAddr_1, _GEN_31) @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
    node _GEN_48 = mux(_T_1, _GEN_32, _GEN_16) @[LVTMultiPortRams.scala 31:34]
    node _GEN_49 = mux(_T_1, _GEN_33, _GEN_17) @[LVTMultiPortRams.scala 31:34]
    node _GEN_50 = mux(_T_1, _GEN_34, _GEN_18) @[LVTMultiPortRams.scala 31:34]
    node _GEN_51 = mux(_T_1, _GEN_35, _GEN_19) @[LVTMultiPortRams.scala 31:34]
    node _GEN_52 = mux(_T_1, _GEN_36, _GEN_20) @[LVTMultiPortRams.scala 31:34]
    node _GEN_53 = mux(_T_1, _GEN_37, _GEN_21) @[LVTMultiPortRams.scala 31:34]
    node _GEN_54 = mux(_T_1, _GEN_38, _GEN_22) @[LVTMultiPortRams.scala 31:34]
    node _GEN_55 = mux(_T_1, _GEN_39, _GEN_23) @[LVTMultiPortRams.scala 31:34]
    node _GEN_56 = mux(_T_1, _GEN_40, _GEN_24) @[LVTMultiPortRams.scala 31:34]
    node _GEN_57 = mux(_T_1, _GEN_41, _GEN_25) @[LVTMultiPortRams.scala 31:34]
    node _GEN_58 = mux(_T_1, _GEN_42, _GEN_26) @[LVTMultiPortRams.scala 31:34]
    node _GEN_59 = mux(_T_1, _GEN_43, _GEN_27) @[LVTMultiPortRams.scala 31:34]
    node _GEN_60 = mux(_T_1, _GEN_44, _GEN_28) @[LVTMultiPortRams.scala 31:34]
    node _GEN_61 = mux(_T_1, _GEN_45, _GEN_29) @[LVTMultiPortRams.scala 31:34]
    node _GEN_62 = mux(_T_1, _GEN_46, _GEN_30) @[LVTMultiPortRams.scala 31:34]
    node _GEN_63 = mux(_T_1, _GEN_47, _GEN_31) @[LVTMultiPortRams.scala 31:34]
    node _GEN_64 = validif(eq(UInt<1>("h0"), io_rdAddr_0), lvtReg_0) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_rdAddr_0), lvtReg_1, _GEN_64) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_rdAddr_0), lvtReg_2, _GEN_65) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_rdAddr_0), lvtReg_3, _GEN_66) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_rdAddr_0), lvtReg_4, _GEN_67) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_rdAddr_0), lvtReg_5, _GEN_68) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_rdAddr_0), lvtReg_6, _GEN_69) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_rdAddr_0), lvtReg_7, _GEN_70) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_rdAddr_0), lvtReg_8, _GEN_71) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_rdAddr_0), lvtReg_9, _GEN_72) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_rdAddr_0), lvtReg_10, _GEN_73) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_rdAddr_0), lvtReg_11, _GEN_74) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_rdAddr_0), lvtReg_12, _GEN_75) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_rdAddr_0), lvtReg_13, _GEN_76) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_rdAddr_0), lvtReg_14, _GEN_77) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_rdAddr_0), lvtReg_15, _GEN_78) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_80 = validif(eq(UInt<1>("h0"), io_rdAddr_1), lvtReg_0) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_81 = mux(eq(UInt<1>("h1"), io_rdAddr_1), lvtReg_1, _GEN_80) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_82 = mux(eq(UInt<2>("h2"), io_rdAddr_1), lvtReg_2, _GEN_81) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_83 = mux(eq(UInt<2>("h3"), io_rdAddr_1), lvtReg_3, _GEN_82) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_84 = mux(eq(UInt<3>("h4"), io_rdAddr_1), lvtReg_4, _GEN_83) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_85 = mux(eq(UInt<3>("h5"), io_rdAddr_1), lvtReg_5, _GEN_84) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_86 = mux(eq(UInt<3>("h6"), io_rdAddr_1), lvtReg_6, _GEN_85) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_87 = mux(eq(UInt<3>("h7"), io_rdAddr_1), lvtReg_7, _GEN_86) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_88 = mux(eq(UInt<4>("h8"), io_rdAddr_1), lvtReg_8, _GEN_87) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_89 = mux(eq(UInt<4>("h9"), io_rdAddr_1), lvtReg_9, _GEN_88) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_90 = mux(eq(UInt<4>("ha"), io_rdAddr_1), lvtReg_10, _GEN_89) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_91 = mux(eq(UInt<4>("hb"), io_rdAddr_1), lvtReg_11, _GEN_90) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_92 = mux(eq(UInt<4>("hc"), io_rdAddr_1), lvtReg_12, _GEN_91) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_93 = mux(eq(UInt<4>("hd"), io_rdAddr_1), lvtReg_13, _GEN_92) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_94 = mux(eq(UInt<4>("he"), io_rdAddr_1), lvtReg_14, _GEN_93) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _GEN_95 = mux(eq(UInt<4>("hf"), io_rdAddr_1), lvtReg_15, _GEN_94) @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
    node _lvtReg_WIRE_0 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_1 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_2 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_3 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_4 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_5 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_6 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_7 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_8 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_9 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_10 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_11 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_12 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_13 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_14 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_WIRE_15 = UInt<2>("h0") @[LVTMultiPortRams.scala 28:31 LVTMultiPortRams.scala 28:31]
    node _lvtReg_io_rdAddr_0 = _GEN_79 @[LVTMultiPortRams.scala 37:17]
    node _lvtReg_io_rdAddr_1 = _GEN_95 @[LVTMultiPortRams.scala 37:17]
    io_rdIdx_0 <= _lvtReg_io_rdAddr_0 @[LVTMultiPortRams.scala 37:17]
    io_rdIdx_1 <= _lvtReg_io_rdAddr_1 @[LVTMultiPortRams.scala 37:17]
    lvtReg_0 <= mux(reset, _lvtReg_WIRE_0, _GEN_48) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_1 <= mux(reset, _lvtReg_WIRE_1, _GEN_49) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_2 <= mux(reset, _lvtReg_WIRE_2, _GEN_50) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_3 <= mux(reset, _lvtReg_WIRE_3, _GEN_51) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_4 <= mux(reset, _lvtReg_WIRE_4, _GEN_52) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_5 <= mux(reset, _lvtReg_WIRE_5, _GEN_53) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_6 <= mux(reset, _lvtReg_WIRE_6, _GEN_54) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_7 <= mux(reset, _lvtReg_WIRE_7, _GEN_55) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_8 <= mux(reset, _lvtReg_WIRE_8, _GEN_56) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_9 <= mux(reset, _lvtReg_WIRE_9, _GEN_57) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_10 <= mux(reset, _lvtReg_WIRE_10, _GEN_58) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_11 <= mux(reset, _lvtReg_WIRE_11, _GEN_59) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_12 <= mux(reset, _lvtReg_WIRE_12, _GEN_60) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_13 <= mux(reset, _lvtReg_WIRE_13, _GEN_61) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_14 <= mux(reset, _lvtReg_WIRE_14, _GEN_62) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]
    lvtReg_15 <= mux(reset, _lvtReg_WIRE_15, _GEN_63) @[LVTMultiPortRams.scala 28:23 LVTMultiPortRams.scala 28:23]

  module LVTMultiPortRams :
    input clock : Clock
    input reset : UInt<1>
    input io_wrAddr_0 : UInt<4>
    input io_wrAddr_1 : UInt<4>
    input io_wrData_0 : UInt<8>
    input io_wrData_1 : UInt<8>
    input io_wrEna_0 : UInt<1>
    input io_wrEna_1 : UInt<1>
    input io_rdAddr_0 : UInt<4>
    input io_rdAddr_1 : UInt<4>
    output io_rdData_0 : UInt<8>
    output io_rdData_1 : UInt<8>

    inst Memory of Memory @[LVTMultiPortRams.scala 52:44]
    inst Memory_1 of Memory @[LVTMultiPortRams.scala 52:44]
    inst Memory_2 of Memory @[LVTMultiPortRams.scala 52:44]
    inst Memory_3 of Memory @[LVTMultiPortRams.scala 52:44]
    inst lvt of LiveValueTable @[LVTMultiPortRams.scala 53:19]
    node _io_rdData_0_T = mul(lvt.io_rdIdx_0, UInt<2>("h2")) @[LVTMultiPortRams.scala 72:30]
    node _io_rdData_0_T_1 = add(_io_rdData_0_T, UInt<1>("h0")) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_0_T_2 = tail(_io_rdData_0_T_1, 1) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_0_T_3 = bits(_io_rdData_0_T_2, 1, 0)
    node mems_0_rdAddr = io_rdAddr_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
    node _GEN_0 = validif(eq(UInt<1>("h0"), _io_rdData_0_T_3), mems_0_rdAddr) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_0_rdData = Memory.io_rdData @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
    node _GEN_1 = validif(eq(UInt<1>("h0"), _io_rdData_0_T_3), mems_0_rdData) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_0_wrEna = io_wrEna_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
    node _GEN_2 = validif(eq(UInt<1>("h0"), _io_rdData_0_T_3), mems_0_wrEna) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_0_wrData = io_wrData_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
    node _GEN_3 = validif(eq(UInt<1>("h0"), _io_rdData_0_T_3), mems_0_wrData) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_0_wrAddr = io_wrAddr_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
    node _GEN_4 = validif(eq(UInt<1>("h0"), _io_rdData_0_T_3), mems_0_wrAddr) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_1_rdAddr = io_rdAddr_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
    node _GEN_5 = mux(eq(UInt<1>("h1"), _io_rdData_0_T_3), mems_1_rdAddr, _GEN_0) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_1_rdData = Memory_1.io_rdData @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
    node _GEN_6 = mux(eq(UInt<1>("h1"), _io_rdData_0_T_3), mems_1_rdData, _GEN_1) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_1_wrEna = io_wrEna_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
    node _GEN_7 = mux(eq(UInt<1>("h1"), _io_rdData_0_T_3), mems_1_wrEna, _GEN_2) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_1_wrData = io_wrData_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
    node _GEN_8 = mux(eq(UInt<1>("h1"), _io_rdData_0_T_3), mems_1_wrData, _GEN_3) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_1_wrAddr = io_wrAddr_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
    node _GEN_9 = mux(eq(UInt<1>("h1"), _io_rdData_0_T_3), mems_1_wrAddr, _GEN_4) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_2_rdAddr = io_rdAddr_0 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
    node _GEN_10 = mux(eq(UInt<2>("h2"), _io_rdData_0_T_3), mems_2_rdAddr, _GEN_5) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_2_rdData = Memory_2.io_rdData @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
    node _GEN_11 = mux(eq(UInt<2>("h2"), _io_rdData_0_T_3), mems_2_rdData, _GEN_6) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_2_wrEna = io_wrEna_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
    node _GEN_12 = mux(eq(UInt<2>("h2"), _io_rdData_0_T_3), mems_2_wrEna, _GEN_7) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_2_wrData = io_wrData_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
    node _GEN_13 = mux(eq(UInt<2>("h2"), _io_rdData_0_T_3), mems_2_wrData, _GEN_8) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_2_wrAddr = io_wrAddr_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
    node _GEN_14 = mux(eq(UInt<2>("h2"), _io_rdData_0_T_3), mems_2_wrAddr, _GEN_9) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_3_rdAddr = io_rdAddr_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
    node _GEN_15 = mux(eq(UInt<2>("h3"), _io_rdData_0_T_3), mems_3_rdAddr, _GEN_10) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_3_rdData = Memory_3.io_rdData @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
    node _GEN_16 = mux(eq(UInt<2>("h3"), _io_rdData_0_T_3), mems_3_rdData, _GEN_11) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_3_wrEna = io_wrEna_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
    node _GEN_17 = mux(eq(UInt<2>("h3"), _io_rdData_0_T_3), mems_3_wrEna, _GEN_12) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_3_wrData = io_wrData_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
    node _GEN_18 = mux(eq(UInt<2>("h3"), _io_rdData_0_T_3), mems_3_wrData, _GEN_13) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node mems_3_wrAddr = io_wrAddr_1 @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
    node _GEN_19 = mux(eq(UInt<2>("h3"), _io_rdData_0_T_3), mems_3_wrAddr, _GEN_14) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _io_rdData_1_T = mul(lvt.io_rdIdx_1, UInt<2>("h2")) @[LVTMultiPortRams.scala 72:30]
    node _io_rdData_1_T_1 = add(_io_rdData_1_T, UInt<1>("h1")) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_1_T_2 = tail(_io_rdData_1_T_1, 1) @[LVTMultiPortRams.scala 72:36]
    node _io_rdData_1_T_3 = bits(_io_rdData_1_T_2, 1, 0)
    node _GEN_20 = validif(eq(UInt<1>("h0"), _io_rdData_1_T_3), mems_0_rdAddr) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_21 = validif(eq(UInt<1>("h0"), _io_rdData_1_T_3), mems_0_rdData) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_22 = validif(eq(UInt<1>("h0"), _io_rdData_1_T_3), mems_0_wrEna) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_23 = validif(eq(UInt<1>("h0"), _io_rdData_1_T_3), mems_0_wrData) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_24 = validif(eq(UInt<1>("h0"), _io_rdData_1_T_3), mems_0_wrAddr) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_25 = mux(eq(UInt<1>("h1"), _io_rdData_1_T_3), mems_1_rdAddr, _GEN_20) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_26 = mux(eq(UInt<1>("h1"), _io_rdData_1_T_3), mems_1_rdData, _GEN_21) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_27 = mux(eq(UInt<1>("h1"), _io_rdData_1_T_3), mems_1_wrEna, _GEN_22) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_28 = mux(eq(UInt<1>("h1"), _io_rdData_1_T_3), mems_1_wrData, _GEN_23) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_29 = mux(eq(UInt<1>("h1"), _io_rdData_1_T_3), mems_1_wrAddr, _GEN_24) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_30 = mux(eq(UInt<2>("h2"), _io_rdData_1_T_3), mems_2_rdAddr, _GEN_25) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_31 = mux(eq(UInt<2>("h2"), _io_rdData_1_T_3), mems_2_rdData, _GEN_26) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_32 = mux(eq(UInt<2>("h2"), _io_rdData_1_T_3), mems_2_wrEna, _GEN_27) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_33 = mux(eq(UInt<2>("h2"), _io_rdData_1_T_3), mems_2_wrData, _GEN_28) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_34 = mux(eq(UInt<2>("h2"), _io_rdData_1_T_3), mems_2_wrAddr, _GEN_29) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_35 = mux(eq(UInt<2>("h3"), _io_rdData_1_T_3), mems_3_rdAddr, _GEN_30) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_36 = mux(eq(UInt<2>("h3"), _io_rdData_1_T_3), mems_3_rdData, _GEN_31) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_37 = mux(eq(UInt<2>("h3"), _io_rdData_1_T_3), mems_3_wrEna, _GEN_32) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_38 = mux(eq(UInt<2>("h3"), _io_rdData_1_T_3), mems_3_wrData, _GEN_33) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _GEN_39 = mux(eq(UInt<2>("h3"), _io_rdData_1_T_3), mems_3_wrAddr, _GEN_34) @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_0_T_3_rdAddr = _GEN_15 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_0_T_3_rdData = _GEN_16 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_0_T_3_wrEna = _GEN_17 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_0_T_3_wrData = _GEN_18 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_0_T_3_wrAddr = _GEN_19 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_1_T_3_rdAddr = _GEN_35 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_1_T_3_rdData = _GEN_36 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_1_T_3_wrEna = _GEN_37 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_1_T_3_wrData = _GEN_38 @[LVTMultiPortRams.scala 72:18]
    node _mems_io_rdData_1_T_3_wrAddr = _GEN_39 @[LVTMultiPortRams.scala 72:18]
    io_rdData_0 <= _mems_io_rdData_0_T_3_rdData @[LVTMultiPortRams.scala 72:18]
    io_rdData_1 <= _mems_io_rdData_1_T_3_rdData @[LVTMultiPortRams.scala 72:18]
    Memory.clock <= clock
    Memory.reset <= reset
    Memory.io_rdAddr <= mems_0_rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory.io_wrEna <= mems_0_wrEna @[LVTMultiPortRams.scala 52:21]
    Memory.io_wrData <= mems_0_wrData @[LVTMultiPortRams.scala 52:21]
    Memory.io_wrAddr <= mems_0_wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory_1.clock <= clock
    Memory_1.reset <= reset
    Memory_1.io_rdAddr <= mems_1_rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory_1.io_wrEna <= mems_1_wrEna @[LVTMultiPortRams.scala 52:21]
    Memory_1.io_wrData <= mems_1_wrData @[LVTMultiPortRams.scala 52:21]
    Memory_1.io_wrAddr <= mems_1_wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory_2.clock <= clock
    Memory_2.reset <= reset
    Memory_2.io_rdAddr <= mems_2_rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory_2.io_wrEna <= mems_2_wrEna @[LVTMultiPortRams.scala 52:21]
    Memory_2.io_wrData <= mems_2_wrData @[LVTMultiPortRams.scala 52:21]
    Memory_2.io_wrAddr <= mems_2_wrAddr @[LVTMultiPortRams.scala 52:21]
    Memory_3.clock <= clock
    Memory_3.reset <= reset
    Memory_3.io_rdAddr <= mems_3_rdAddr @[LVTMultiPortRams.scala 52:21]
    Memory_3.io_wrEna <= mems_3_wrEna @[LVTMultiPortRams.scala 52:21]
    Memory_3.io_wrData <= mems_3_wrData @[LVTMultiPortRams.scala 52:21]
    Memory_3.io_wrAddr <= mems_3_wrAddr @[LVTMultiPortRams.scala 52:21]
    lvt.clock <= clock
    lvt.reset <= reset
    lvt.io_wrAddr_0 <= io_wrAddr_0 @[LVTMultiPortRams.scala 65:22]
    lvt.io_wrAddr_1 <= io_wrAddr_1 @[LVTMultiPortRams.scala 65:22]
    lvt.io_wrEna_0 <= io_wrEna_0 @[LVTMultiPortRams.scala 64:21]
    lvt.io_wrEna_1 <= io_wrEna_1 @[LVTMultiPortRams.scala 64:21]
    lvt.io_rdAddr_0 <= io_rdAddr_0 @[LVTMultiPortRams.scala 68:22]
    lvt.io_rdAddr_1 <= io_rdAddr_1 @[LVTMultiPortRams.scala 68:22]
