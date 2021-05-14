package memory
import chisel3._
import chisel3.iotesters._
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
  chisel3.iotesters.Driver(() => new XORMultiPortMemory(2, 2)) {
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
  chisel3.iotesters.Driver(() => new OneHotCodeILvtMultiPortMemory(5, 5)) {
    c => new OneHotCodeILvtMultiPortMemoryTest(c)
  }
}