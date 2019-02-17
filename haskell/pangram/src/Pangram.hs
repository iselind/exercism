module Pangram (isPangram) where

import Data.Char

alphabet :: String
alphabet = ['a'..'z']

isPangram :: String -> Bool
isPangram text = all (`elem` txt) alphabet
    where txt = map toLower text
