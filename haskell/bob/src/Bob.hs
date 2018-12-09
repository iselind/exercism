module Bob (responseFor) where

import Data.Char

isQuestion :: String -> Bool
isQuestion xs = '?' == (last xs)

isYelling :: String -> Bool
isYelling xs = ((map toUpper xs) == xs) && ((map toLower xs) /= xs )

responseFor :: String -> String
responseFor xs
    | (isYelling xs) && (isQuestion xs) = "Calm down, I know what I'm doing!"
    | (isQuestion xs) = "Sure."
    | (isYelling xs) = "Whoa, chill out!"
    | otherwise = "Whatever."
