module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor xs
    | '.' == (last xs) = "Whatever."
    | (map toUpper xs) == xs = "Whoa, chill out!"
    | '?' == (last xs) = "Sure."
    | otherwise = "Whatever."
