package memory

import java.io.{File, FileWriter}

/**
 * @author YueChen
 */
object Main extends App {
  val dir = new File("out");
  dir.mkdirs
  val systemVerilog = chisel3.stage.ChiselStage.emitSystemVerilog(new OneHotCodeILvtMultiPortMemory(2, 2, 16, 8))
  val systemVerilogWriter = new FileWriter(new File(dir, "OneHotCodeILvtMultiPortMemory16.sv"))
  systemVerilogWriter write systemVerilog
  systemVerilogWriter.close()
}
