package memory

import chisel3._

/**
 * @author YueChen
 */

/**
 * Live Value Table Multi-Port RAMs
 * based on https://tomverbeure.github.io/2019/08/03/Multiport-Memories.html
 */

class LiveValueTable(m: Int, n: Int) extends Module {
  val io = IO(new Bundle{
    val wrAddr = Input(Vec(m, UInt(10.W)))
    val wrEna = Input(Vec(m, Bool()))

    val rdAddr = Input(Vec(n, UInt(10.W)))
    val rdIdx = Output(Vec(n, UInt((math.log(m) / math.log(2) + 1).toInt.W)))
  })

  // initialization
  val lvtInitArray = new Array[Int](128)
  for(i <- 0 until 128) {
    lvtInitArray(i) = 0
  }
  val lvtReg = RegInit(VecInit(lvtInitArray.map(_.U((math.log(m) / math.log(2) + 1).toInt.W))))

  for(i <- 0 until m) {
    when(io.wrEna(i) === true.B) {
      lvtReg(io.wrAddr(i)) := i.U
    }
  }

  for(i <- 0 until n) {
    io.rdIdx(i) := lvtReg(io.rdAddr(i))
  }
}


class LVTMultiPortRams(m: Int, n: Int) extends Module{
  val io = IO(new Bundle{
    val wrAddr = Input(Vec(m, UInt(10.W)))
    val wrData = Input(Vec(m, UInt(8.W)))
    val wrEna = Input(Vec(m, Bool()))

    val rdAddr = Input(Vec(n, UInt(10.W)))
    val rdData = Output(Vec(n, UInt(8.W)))
  })
  val mems = VecInit(Seq.fill(m * n)(Module(new Memory(1024, 8)).io))
  val lvt = Module(new LiveValueTable(m, n))

  for(i <- 0 until m) {
    for(j <- 0 until n) {
      mems(i * n + j).wrEna := io.wrEna(i)
      mems(i * n + j).wrAddr := io.wrAddr(i)
      mems(i * n + j).wrData := io.wrData(i)
      mems(i * n + j).rdAddr := io.rdAddr(j)
    }
  }
  for(i <- 0 until m) {
    lvt.io.wrEna(i) := io.wrEna(i)
    lvt.io.wrAddr(i) := io.wrAddr(i)
  }
  for(i <- 0 until n) {
    lvt.io.rdAddr(i) := io.rdAddr(i)
  }
  for(i <- 0 until n) {
    val sel = lvt.io.rdIdx(i)
    io.rdData(i) := mems(sel * n.U + i.U).rdData
  }
}