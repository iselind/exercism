module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map,(!))
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

count :: String -> Map Nucleotide Int-> Either String (Map Nucleotide Int)
count [] result = Right result
count ('A':xs) result = count xs (Map.insert A ((result ! A)+1) result)
count ('C':xs) result = count xs (Map.insert C ((result ! C)+1) result)
count ('G':xs) result = count xs (Map.insert G ((result ! G)+1) result)
count ('T':xs) result = count xs (Map.insert T ((result ! T)+1) result)
count (_:xs) result = Left "Bad character in input"

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = count xs (Map.fromList([(A,0),(C,0),(G,0),(T,0)]))
