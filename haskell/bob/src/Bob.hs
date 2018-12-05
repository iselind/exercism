module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor xs
    | '.' == (last xs) = "Whatever."
    | (map toUpper xs) == xs && '?' == (last xs) = "Calm down, I know what I'm doing!"
    | (map toUpper xs) == (map toLower xs) = "Whatever."
    | (map toUpper xs) == xs = "Whoa, chill out!"
    | '?' == (last xs) = "Sure."
    | otherwise = "Whatever."
