package reg

import java.io.{File, FileWriter}

import chisel3._
/**
 * @author YueChen
 */
class Reg extends Module{
  val io = IO(new Bundle() {
    val in = Input(Bool())
    val out = Output(Bool())
  })

  val inReg = RegInit(false.B)
  inReg := io.in

  io.out := inReg
}

object Reg extends App {
  val dir = new File("out") ; dir.mkdirs
  val systemVerilog = chisel3.stage.ChiselStage.emitSystemVerilog(new Reg())
  val systemVerilogWriter = new FileWriter(new File(dir, "Reg.sv"))
  systemVerilogWriter write systemVerilog
  systemVerilogWriter.close
}