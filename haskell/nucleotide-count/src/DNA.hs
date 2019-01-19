module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map,(!))
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

isNucleoticeString :: String -> Bool
isNucleoticeString [] =  True
isNucleoticeString (x:xs)
    | x == 'A' = isNucleoticeString xs
    | x == 'C' = isNucleoticeString xs
    | x == 'G' = isNucleoticeString xs
    | x == 'T' = isNucleoticeString xs
    | otherwise = False

stringToNucleotides :: String -> [Nucleotide]
stringToNucleotides [] = []
stringToNucleotides (x:xs)
    | x == 'A' = A : stringToNucleotides xs
    | x == 'C' = C : stringToNucleotides xs
    | x == 'G' = G : stringToNucleotides xs
    | x == 'T' = T : stringToNucleotides xs

count :: [Nucleotide] -> Map Nucleotide Int-> Map Nucleotide Int
count [] result = result
count (x:xs) result = count xs (Map.insert x ((result ! x)+1) result)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
    | isNucleoticeString xs == False = Left "Bad character in input"
    | otherwise = Right answer
    where answer = count (stringToNucleotides xs) (Map.fromList([(A,0),(C,0),(G,0),(T,0)]))
