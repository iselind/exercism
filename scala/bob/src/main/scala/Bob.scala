object Bob {
  def isQuestion(statement: String): Boolean = {
    statement.trim.endsWith("?")
  }

  def containLetters(statement: String): Boolean = {
      val onlyTheLetters = statement.replaceAll("[^a-zA-Z]","")

      onlyTheLetters.length > 0
  }

  def isScreaming(statement: String): Boolean = {
    statement.toUpperCase().equals(statement)
  }

  def isQuiet(statement: String): Boolean = {
    statement.trim.length == 0
  }

  def response(statement: String): String = {
    if (isQuiet(statement)) {
      "Fine. Be that way!"
    } else if (isScreaming(statement)) {
      if (!containLetters(statement)) {
        if (isQuestion(statement)) {
          "Sure."
        } else {
          "Whatever."
        }
      } else if (isQuestion(statement)) {
        "Calm down, I know what I'm doing!"
      } else {
        "Whoa, chill out!"
      }
    } else if (isQuestion(statement)) {
      "Sure."
    } else {
      "Whatever."
    }
  }
}
