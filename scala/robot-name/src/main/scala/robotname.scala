object Robot {
  val prefixes = for (x <- 'A' to 'Z'; y <- 'A' to 'Z') yield ""+x+y
  var runningNumber: Int = 0
  val suffixSeriesLength: Int = 1000
}

class Robot() {
  var name: String = ""

  reset()

  def reset() {
    name = {
      val prefix = Robot.prefixes(Robot.runningNumber/Robot.suffixSeriesLength)
      val suffix = Robot.runningNumber % Robot.suffixSeriesLength

      Robot.runningNumber += 1

      f"$prefix%s$suffix%03d"
    }
  }
}
