module DNA (nucleotideCounts, Nucleotide(..)) where

-- Import the type Map from Data.Map.Strict
import Data.Map.Strict (Map)
-- Specify that to use any of the Map operations we need to qualify them
import qualified Data.Map.Strict as Map

-- Specify that to use any of the List operations we need to qualify them
import qualified Data.List as List

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

-- Check if a string characters correspond to a Nucleotide
isNucleoticeStringCharacter :: Char -> Bool
isNucleoticeStringCharacter x = x `List.elem` "ACGT"

-- This function doesn't cover all characters, not sure how to deal with that
-- when using this in map. toNucleotide is only used in this file and it's not
-- exported, so in some sense it's safe. If it were exported, how would I make
-- it safe for all characters?
toNucleotide :: Char -> Nucleotide
toNucleotide 'A' = A
toNucleotide 'C' = C
toNucleotide 'G' = G
toNucleotide 'T' = T
toNucleotide _ = A -- What to do in this case?

-- Convert a string of characters to a list of Nucleotides
stringToNucleotides :: String -> [Nucleotide]
stringToNucleotides x = map toNucleotide x

-- Given a Map and a Nucleotide, update the Map accordingly
count :: Map Nucleotide Int -> Nucleotide -> Map Nucleotide Int
count result x = Map.insertWith (+) x 1 result

-- Either count the Nucleotides in first parameter, or return error
nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
    | not (all isNucleoticeStringCharacter xs) = Left "Bad character in input"
    | otherwise = Right answer
    where answer = foldl count (Map.fromList([(A,0),(C,0),(G,0),(T,0)])) (stringToNucleotides xs)
