module SpaceAge (Planet(..), ageOn) where

-- Types

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

type Seconds = Float
type Years = Float

-- Constants

earthYear :: Seconds
earthYear = 60 * 60 * 24 * 365.25

orbitalPeriod :: Planet -> Float
orbitalPeriod Mercury = earthYear * 0.2408467
orbitalPeriod Venus = earthYear * 0.61519726
orbitalPeriod Earth = earthYear
orbitalPeriod Mars = earthYear * 1.8808158
orbitalPeriod Jupiter = earthYear * 11.862615
orbitalPeriod Saturn = earthYear * 29.447498
orbitalPeriod Uranus = earthYear * 84.016846
orbitalPeriod Neptune = earthYear * 164.79132

-- Functions

ageOn :: Planet -> Seconds -> Years
ageOn planet seconds = seconds / orbitalPeriod planet
