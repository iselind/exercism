module Bob (responseFor) where

import Data.Char

-- myLast return the last character in xs skipping spaces at the end
myLast :: String -> Char
myLast xs = head $ dropWhile (== ' ') (reverse xs)

-- isQuestion returns True if xs is a question, i.e. it ends with a question mark
isQuestion :: String -> Bool
isQuestion xs = (not $ null xs) && ('?' == (myLast xs))

-- isYelling returns True if all characters available in different case are in the upper case only
isYelling :: String -> Bool
isYelling xs = ((map toUpper xs) == xs) && ((map toLower xs) /= xs )

-- isJibberish returns True if there is only whitespace in the inparameter
isJibberish :: String -> Bool
isJibberish (' ':xs) =isJibberish xs
isJibberish ('\t':xs) = isJibberish xs
isJibberish ('\n':xs) = isJibberish xs
isJibberish ('\r':xs) = isJibberish xs
isJibberish [] = True
isJibberish _ = False

responseFor :: String -> String
responseFor xs
    | (isJibberish xs) = "Fine. Be that way!"
    | (isYelling xs) && (isQuestion xs) = "Calm down, I know what I'm doing!"
    | (isQuestion xs) = "Sure."
    | (isYelling xs) = "Whoa, chill out!"
    | otherwise = "Whatever."
