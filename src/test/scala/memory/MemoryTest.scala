package memory

import Chisel.fromtIntToLiteral
import chisel3.iotesters.PeekPokeTester

/**
 * @author YueChen
 */

class MemoryTest(dut: Memory) extends PeekPokeTester(dut) {
  poke(dut.io.wrAddr, 0.U)
  poke(dut.io.wrData, 19.U)
  poke(dut.io.wrEna, 1.U)
  step(1)
  poke(dut.io.rdAddr, 0.U)
  step(1)
  expect(dut.io.rdData, 19.U)
}

object MemoryTest extends App {
  chisel3.iotesters.Driver(() => new Memory(16, 8)) {
    c => new MemoryTest(c)
  }
}