object MatchingBrackets {
  def isPaired(data: String): Boolean = {
    var bracketCount:Int = 0
    var curlyCount:Int = 0
    var parentesisCount:Int = 0
    var otherCharacters:Int = 0
    for (c <- data) {
      c match {
        case '(' => parentesisCount += 1
        case ')' => {
          parentesisCount -= 1
          if (parentesisCount < 0) {
            return false
          }
        }
        case '{' => curlyCount += 1
        case '}' => {
          curlyCount -= 1
          if (curlyCount < 0) {
            return false
          }
        }
        case '[' => {
          bracketCount += 1
        }
        case ']' => {
          bracketCount -= 1
          if (bracketCount < 0) {
            return false
          }
        }
        case _ => otherCharacters += 1
      }
    }

    bracketCount == 0 && curlyCount == 0
  }
}
