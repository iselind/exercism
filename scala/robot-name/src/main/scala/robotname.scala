object Robot {
  var runningNumber: Int = 0
}

class Robot() {
  var name: String = ""

  reset()

  def reset() {
    name = {
      Robot.runningNumber = Robot.runningNumber + 1
      val runningNumber = Robot.runningNumber
      f"AB$runningNumber%03d"
    }
  }
}
