module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

-- Check if a string characters correspond to a Nucleotide
isNucleoticeStringCharacter :: Char -> Bool
isNucleoticeStringCharacter 'A' = True
isNucleoticeStringCharacter 'C' = True
isNucleoticeStringCharacter 'G' = True
isNucleoticeStringCharacter 'T' = True
isNucleoticeStringCharacter _ = False

-- Convert a string of characters to a list of Nucleotides
stringToNucleotides :: String -> [Nucleotide]
stringToNucleotides [] = []
stringToNucleotides ('A':xs) = A : stringToNucleotides xs
stringToNucleotides ('C':xs) = C : stringToNucleotides xs
stringToNucleotides ('G':xs) = G : stringToNucleotides xs
stringToNucleotides ('T':xs) = T : stringToNucleotides xs

-- Given a Map and a Nucleotide, update the Map accordingly
count :: Map Nucleotide Int -> Nucleotide -> Map Nucleotide Int
count result x = Map.insertWith (+) x 1 result

-- Either count the Nucleotides in first parameter, or return error
nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
    | not (all isNucleoticeStringCharacter xs) = Left "Bad character in input"
    | otherwise = Right answer
    where answer = foldl count (Map.fromList([(A,0),(C,0),(G,0),(T,0)])) (stringToNucleotides xs)
