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
    var stack = List[Char]()

    try {
      for (c <- data) {
        c match {
          case '(' | '[' | '{' => stack = c :: stack // Push c onto stack
          case ')' | ']' | '}' => {
            // Pop the stack
            val cShouldMatchWith = stack.head
            stack = stack.tail

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
      stack.isEmpty
    } catch {
      case e: NoSuchElementException => false
    }
  }
}
