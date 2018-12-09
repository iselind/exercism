module Bob (responseFor) where

import Data.Char

isQuestion :: String -> Bool
isQuestion xs = (not $ null xs) && ('?' == (last xs))

isYelling :: String -> Bool
isYelling xs = ((map toUpper xs) == xs) && ((map toLower xs) /= xs )

isJibberish :: String -> Bool
isJibberish xs = null xs

responseFor :: String -> String
responseFor xs
    | (isJibberish xs) = "Fine. Be that way!"
    | (isYelling xs) && (isQuestion xs) = "Calm down, I know what I'm doing!"
    | (isQuestion xs) = "Sure."
    | (isYelling xs) = "Whoa, chill out!"
    | otherwise = "Whatever."
