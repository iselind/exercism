module Acronym (abbreviate) where

import Data.Char

-- cleanCharacters will change any - characters to space characters
cleanCharacters :: String -> String
cleanCharacters [] = []
cleanCharacters ('-':xs) = ' ':xs
cleanCharacters (x:xs) = x: cleanCharacters xs

abbreviate :: String -> String
abbreviate xs = map (toUpper . head) $ words $ cleanCharacters xs
