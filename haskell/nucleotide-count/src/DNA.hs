module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

-- Check if a string characters correspond to a Nucleotide
isNucleoticeStringCharacter :: Char -> Bool
isNucleoticeStringCharacter x
    | x == 'A' = True
    | x == 'C' = True
    | x == 'G' = True
    | x == 'T' = True
    | otherwise = False

-- Convert a string of characters to a list of Nucleotides
stringToNucleotides :: String -> [Nucleotide]
stringToNucleotides [] = []
stringToNucleotides (x:xs)
    | x == 'A' = A : stringToNucleotides xs
    | x == 'C' = C : stringToNucleotides xs
    | x == 'G' = G : stringToNucleotides xs
    | x == 'T' = T : stringToNucleotides xs

-- Given a Map and a Nucleotide, update the Map accordingly
count :: Map Nucleotide Int -> Nucleotide -> Map Nucleotide Int
count result x = Map.insertWith (+) x 1 result

-- Either count the Nucleotides in first parameter, or return error
nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
    | not (all isNucleoticeStringCharacter xs) = Left "Bad character in input"
    | otherwise = Right answer
    where answer = foldl count (Map.fromList([(A,0),(C,0),(G,0),(T,0)])) (stringToNucleotides xs)
