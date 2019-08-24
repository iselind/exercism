object Bob {
  def response(statement: String): String = {
    if (statement.trim.length == 0) {
      "Fine. Be that way!"
    } else if (statement.toUpperCase().equals(statement)) {
      val onlyTheLetters = statement.replaceAll("[^a-zA-Z]","")

      if (onlyTheLetters.length == 0) {
        if (statement.endsWith("?")) {
          "Sure."
        } else {
          "Whatever."
        }
      } else if (statement.endsWith("?")) {
        "Calm down, I know what I'm doing!"
      } else {
        "Whoa, chill out!"
      }
    } else if (statement.trim.endsWith("?")) {
      "Sure."
    } else {
      "Whatever."
    }
  }
}
