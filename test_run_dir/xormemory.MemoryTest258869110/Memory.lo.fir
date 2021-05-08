circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<4>
    output io_rdData : UInt<8>
    input io_wrEna : UInt<1>
    input io_wrData : UInt<8>
    input io_wrAddr : UInt<4>

    reg mem_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_0) @[Memory.scala 18:20]
    reg mem_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_1) @[Memory.scala 18:20]
    reg mem_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_2) @[Memory.scala 18:20]
    reg mem_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_3) @[Memory.scala 18:20]
    reg mem_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_4) @[Memory.scala 18:20]
    reg mem_5 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_5) @[Memory.scala 18:20]
    reg mem_6 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_6) @[Memory.scala 18:20]
    reg mem_7 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_7) @[Memory.scala 18:20]
    reg mem_8 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_8) @[Memory.scala 18:20]
    reg mem_9 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_9) @[Memory.scala 18:20]
    reg mem_10 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_10) @[Memory.scala 18:20]
    reg mem_11 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_11) @[Memory.scala 18:20]
    reg mem_12 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_12) @[Memory.scala 18:20]
    reg mem_13 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_13) @[Memory.scala 18:20]
    reg mem_14 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_14) @[Memory.scala 18:20]
    reg mem_15 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_15) @[Memory.scala 18:20]
    reg wrDateReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDateReg) @[Memory.scala 20:26]
    node _doForwardReg_T = eq(io_wrAddr, io_rdAddr) @[Memory.scala 21:40]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_wrEna) @[Memory.scala 21:54]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[Memory.scala 21:29]
    node _mem_io_wrAddr = io_wrData @[Memory.scala 25:20 Memory.scala 25:20]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_wrAddr), _mem_io_wrAddr, mem_0) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_wrAddr), _mem_io_wrAddr, mem_1) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_wrAddr), _mem_io_wrAddr, mem_2) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_wrAddr), _mem_io_wrAddr, mem_3) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_wrAddr), _mem_io_wrAddr, mem_4) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_wrAddr), _mem_io_wrAddr, mem_5) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_wrAddr), _mem_io_wrAddr, mem_6) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_wrAddr), _mem_io_wrAddr, mem_7) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_wrAddr), _mem_io_wrAddr, mem_8) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_wrAddr), _mem_io_wrAddr, mem_9) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_wrAddr), _mem_io_wrAddr, mem_10) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_wrAddr), _mem_io_wrAddr, mem_11) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_wrAddr), _mem_io_wrAddr, mem_12) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_wrAddr), _mem_io_wrAddr, mem_13) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_wrAddr), _mem_io_wrAddr, mem_14) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_wrAddr), _mem_io_wrAddr, mem_15) @[Memory.scala 25:20 Memory.scala 25:20 Memory.scala 18:20]
    node _GEN_16 = mux(io_wrEna, _GEN_0, mem_0) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_17 = mux(io_wrEna, _GEN_1, mem_1) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_18 = mux(io_wrEna, _GEN_2, mem_2) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_19 = mux(io_wrEna, _GEN_3, mem_3) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_20 = mux(io_wrEna, _GEN_4, mem_4) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_21 = mux(io_wrEna, _GEN_5, mem_5) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_22 = mux(io_wrEna, _GEN_6, mem_6) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_23 = mux(io_wrEna, _GEN_7, mem_7) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_24 = mux(io_wrEna, _GEN_8, mem_8) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_25 = mux(io_wrEna, _GEN_9, mem_9) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_26 = mux(io_wrEna, _GEN_10, mem_10) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_27 = mux(io_wrEna, _GEN_11, mem_11) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_28 = mux(io_wrEna, _GEN_12, mem_12) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_29 = mux(io_wrEna, _GEN_13, mem_13) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_30 = mux(io_wrEna, _GEN_14, mem_14) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_31 = mux(io_wrEna, _GEN_15, mem_15) @[Memory.scala 24:18 Memory.scala 18:20]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_rdAddr), mem_0) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_rdAddr), mem_1, _GEN_32) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_rdAddr), mem_2, _GEN_33) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_rdAddr), mem_3, _GEN_34) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_rdAddr), mem_4, _GEN_35) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_rdAddr), mem_5, _GEN_36) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_rdAddr), mem_6, _GEN_37) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_rdAddr), mem_7, _GEN_38) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_rdAddr), mem_8, _GEN_39) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_rdAddr), mem_9, _GEN_40) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_rdAddr), mem_10, _GEN_41) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_rdAddr), mem_11, _GEN_42) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_rdAddr), mem_12, _GEN_43) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_rdAddr), mem_13, _GEN_44) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_rdAddr), mem_14, _GEN_45) @[Memory.scala 27:19 Memory.scala 27:19]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_rdAddr), mem_15, _GEN_46) @[Memory.scala 27:19 Memory.scala 27:19]
    node _mem_io_rdAddr = _GEN_47 @[Memory.scala 27:19]
    node _io_rdData_T = mux(doForwardReg, wrDateReg, _mem_io_rdAddr) @[Memory.scala 27:19]
    node _mem_WIRE_0 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_1 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_2 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_3 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_4 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_5 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_6 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_7 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_8 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_9 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_10 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_11 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_12 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_13 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_14 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    node _mem_WIRE_15 = UInt<8>("h0") @[Memory.scala 18:28 Memory.scala 18:28]
    io_rdData <= _io_rdData_T @[Memory.scala 27:13]
    mem_0 <= mux(reset, _mem_WIRE_0, _GEN_16) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_1 <= mux(reset, _mem_WIRE_1, _GEN_17) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_2 <= mux(reset, _mem_WIRE_2, _GEN_18) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_3 <= mux(reset, _mem_WIRE_3, _GEN_19) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_4 <= mux(reset, _mem_WIRE_4, _GEN_20) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_5 <= mux(reset, _mem_WIRE_5, _GEN_21) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_6 <= mux(reset, _mem_WIRE_6, _GEN_22) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_7 <= mux(reset, _mem_WIRE_7, _GEN_23) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_8 <= mux(reset, _mem_WIRE_8, _GEN_24) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_9 <= mux(reset, _mem_WIRE_9, _GEN_25) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_10 <= mux(reset, _mem_WIRE_10, _GEN_26) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_11 <= mux(reset, _mem_WIRE_11, _GEN_27) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_12 <= mux(reset, _mem_WIRE_12, _GEN_28) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_13 <= mux(reset, _mem_WIRE_13, _GEN_29) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_14 <= mux(reset, _mem_WIRE_14, _GEN_30) @[Memory.scala 18:20 Memory.scala 18:20]
    mem_15 <= mux(reset, _mem_WIRE_15, _GEN_31) @[Memory.scala 18:20 Memory.scala 18:20]
    wrDateReg <= io_wrData @[Memory.scala 20:26]
    doForwardReg <= _doForwardReg_T_1 @[Memory.scala 21:29]
