object SpaceAge {
  val earthYearSeconds = 31557600
  def onEarth(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 1)
  }
  def onMercury(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 0.2408467)
  }
  def onVenus(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 0.61519726)
  }
  def onMars(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 1.8808158)
  }
  def onJupiter(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 11.862615)
  }
  def onSaturn(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 29.447498)
  }
  def onUranus(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 84.016846)
  }
  def onNeptune(ageSeconds: Double): Double = {
    ageSeconds / (earthYearSeconds * 164.79132)
  }
}
