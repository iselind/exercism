import java.lang.Throwable
import java.util.NoSuchElementException
import scala.collection.mutable.Map
import scala.collection.mutable.Stack

object MatchingBrackets {
  // matchingPairs enables us to look up what the matching start character of
  // the pair would be
  val matchingPairs = {
    val m = Map[Char, Char]()
    m.put('}', '{')
    m.put(')', '(')
    m.put(']', '[')
    m
  }

  // isPaired will return true if all the parenthesis are matched properly,
  // otherwise false will be returned
  def isPaired(data: String): Boolean = {
    var s = List[Char]()

    try {
      for (c <- data) {
        c match {
          case '(' | '[' | '{' => s = c :: s // Push c onto s
          case ')' | ']' | '}' => {
            // Pop the stack
            val cShouldMatchWith = s.head
            s = s.tail

            val theChar = MatchingBrackets.matchingPairs.get(c)
            theChar match {
              case Some(b) => {
                if (cShouldMatchWith != b) {
                  return false
                }
              }
              case None => {
                throw new RuntimeException("Unexpected character encountered: " + c)
              }
            }
          }
          case _ =>
        }
      }
      s.isEmpty
    } catch {
      case e: NoSuchElementException => false
    }
  }
}
