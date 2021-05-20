package memory

import Chisel.{fromBooleanToLiteral, fromtIntToLiteral}
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

class XORMultiPortMemoryTest(dut: XORMultiPortMemory) extends PeekPokeTester(dut) {
  poke(dut.io.wrAddr(0), 0.U)
  poke(dut.io.wrData(0), 19.U)
  poke(dut.io.wrAddr(1), 2.U)
  poke(dut.io.wrData(1), 29.U)
  poke(dut.io.wrEna(0), true.B)
  poke(dut.io.wrEna(1), true.B)
  step(1)
  poke(dut.io.rdAddr(0), 2.U)
  poke(dut.io.rdAddr(1), 0.U)
  step(1)
  expect(dut.io.rdData(0), 29.U)
  expect(dut.io.rdData(1), 19.U)
}

object XORMultiPortMemoryTest extends App {
  chisel3.iotesters.Driver(() => new XORMultiPortMemory(2, 2, 1024, 8)) {
    c => new XORMultiPortMemoryTest(c)
  }
}

class OneHotCodeILvtMultiPortMemoryTest(dut: OneHotCodeILvtMultiPortMemory) extends PeekPokeTester(dut) {
  poke(dut.io.wrAddr(0), 0.U)
  poke(dut.io.wrData(0), 19.U)
  poke(dut.io.wrAddr(1), 2.U)
  poke(dut.io.wrData(1), 29.U)
  poke(dut.io.wrAddr(3), 6.U)
  poke(dut.io.wrData(3), 108.U)
  poke(dut.io.wrEna(0), true.B)
  poke(dut.io.wrEna(1), true.B)
  poke(dut.io.wrEna(3), true.B)

  step(1)
  poke(dut.io.rdAddr(0), 2.U)
  poke(dut.io.rdAddr(1), 0.U)
  poke(dut.io.rdAddr(4), 6.U)
  step(1)
  expect(dut.io.rdData(0), 29.U)
  expect(dut.io.rdData(1), 19.U)
  expect(dut.io.rdData(4), 108.U)

}

object OneHotCodeILvtMultiPortMemoryTest extends App {
  chisel3.iotesters.Driver(() => new OneHotCodeILvtMultiPortMemory(5, 5, 1024, 8)) {
    c => new OneHotCodeILvtMultiPortMemoryTest(c)
  }
}

class LVTMultiPortRamsTest(dut: LVTMultiPortRams) extends PeekPokeTester(dut) {
  poke(dut.io.wrAddr(0), 0.U)
  poke(dut.io.wrAddr(1), 5.U)
  poke(dut.io.wrData(0), 0.U)
  poke(dut.io.wrData(1), 31.U)
  poke(dut.io.wrEna(0), false.B)
  poke(dut.io.wrEna(1), true.B)
  step(1)
  expect(dut.lvt.lvtReg(0.U), 1.U)
}

object LVTMultiPortRamsTest extends App {
  chisel3.iotesters.Driver(() => new LVTMultiPortRams(2, 2, 16, 8)) {
    c => new LVTMultiPortRamsTest(c)
  }
}