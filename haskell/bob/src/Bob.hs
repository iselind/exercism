module Bob (responseFor) where

import Data.Char
import Data.List

-- isQuestion returns True if xs is a question, i.e. it ends with a question mark
isQuestion :: String -> Bool
isQuestion xs = "?" `isSuffixOf` xs

-- isYelling returns True if all characters available in different case are in the upper case only
isYelling :: String -> Bool
isYelling xs = ((map toUpper xs) == xs) && ((map toLower xs) /= xs )

responseFor :: String -> String
responseFor xs
    | (null shaved) = "Fine. Be that way!"
    | (isYelling shaved) && (isQuestion shaved) = "Calm down, I know what I'm doing!"
    | (isQuestion shaved) = "Sure."
    | (isYelling shaved) = "Whoa, chill out!"
    | otherwise = "Whatever."
    where shaved = filter (not . isSpace) xs
