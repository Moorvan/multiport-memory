package memory
import java.io.{File, FileWriter}

/**
 * @author YueChen
 * @date 2021/2/16 16:51
 * @version 1.0
 */
object Main extends App {
  val dir = new File("out") ; dir.mkdirs
  val systemVerilog = chisel3.stage.ChiselStage.emitSystemVerilog(new XORMultiPortMemory(2, 2))
  val systemVerilogWriter = new FileWriter(new File(dir, "XORMultiPortMemory.sv"))
  systemVerilogWriter write systemVerilog
  systemVerilogWriter.close()
}
