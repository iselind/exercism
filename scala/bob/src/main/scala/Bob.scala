object Bob {
  def response(statement: String): String = {
    // Question: Can I do the following with a match statement?
    // - Matching strings that start or end with certain character(s).
    if (statement.toUpperCase().equals(statement)) {
      "Whoa, chill out!"
    } else if (statement.endsWith("?")) {
      "Sure."
    } else {
      "Whatever."
    }
  }
}
