import scala.util._
import scala.math._

object Robot {
  val prefixes = for (x <- 'A' to 'Z'; y <- 'A' to 'Z') yield ""+x+y
  val suffixSeriesLength: Int = 1000
  val rnd = new Random()
}

class Robot() {
  private var myName: String = ""

  reset()

  def name(): String = myName

  def reset() {
    myName = {
      /*
       * If we were to generate all possible names randomly without repeating
       * ourselves. Then this method would take longer and longer to execute
       * the more of the names have been consumed/generated.
       *
       * This is because if we see that a name has already been used, then we
       * have to try again, and again, and again and so on until we find an
       * unused name.
       *
       * Not sure how to do this in any more efficient way if the names are to
       * be generated at random.
       *
       * It would be a completely different story if I were to generate all
       * names in sequence given a running number with which we would pick
       * prefix and suffix based on the running number. As the challenge is
       * meant to use the Random class, then this isn't a viable option here.
       */
      val runningNumber = Robot.rnd.nextInt(max(Robot.prefixes.length, Robot.suffixSeriesLength))
      val prefix = Robot.prefixes(runningNumber % Robot.prefixes.length)
      val suffix = runningNumber % Robot.suffixSeriesLength

      f"$prefix%s$suffix%03d"
    }
  }
}
