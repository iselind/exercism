module Diamond (diamond) where

import Data.List
import Data.Maybe

-- replaceallbut will replace all characters in the input string with a
-- whitespace unless the character is the needle
replaceallbut :: Char -> String -> String
replaceallbut needle (x:xs)
	| x == needle = needle : replaceallbut needle xs
	| otherwise = ' ' : replaceallbut needle xs
replaceallbut _ [] = []

generateline :: Char -> String
generateline c = (reverse $ take (length-1) $ drop 1 upperAlphabet) ++ (take length upperAlphabet)
	where length = succ $ fromJust $ elemIndex c upperAlphabet

-- (drop 3 $ reverse $ drop 1 "abcdef") ++ (take 3 "abcedf")
-- produce "cbabc"
-- (reverse $ take 2 $ drop 1 "abcdef") ++ (take 2 "abcdef")
-- produce "cbabc"

upperAlphabet :: [Char]
upperAlphabet = ['A' .. 'Z']


diamond :: Char -> Maybe [String]
diamond c = Just ( [c] : [])
