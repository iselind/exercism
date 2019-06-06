module Acronym (abbreviate) where

import Data.Char

-- shouldReplaceWithSpace is a predicate function we use to specify under which
-- circumstances the current character, a, should be replaced by a ' '
-- character
shouldReplaceWithSpace :: Char -> Char -> Bool
shouldReplaceWithSpace a b = a == '-' || isUpper b && isLower a

-- fixWordDelimiters converts various characters and sequences of characters
-- into proper word delimiters using the provided predicate function
fixWordDelimiters :: (Char -> Char -> Bool) -> String -> String

-- The Base case, At the end of string there's no reason to call
-- fixWordDelimiters again
fixWordDelimiters _ [] = []

-- If the string contains a lower case character followed by an upper case
-- character, remove the lower case character with a ' ' character
fixWordDelimiters f (x:y:xs) =
    let replacementCharacter = if f x y then  ' ' else x
    in replacementCharacter : fixWordDelimiters f (y:xs)

-- For all other cases where nothing of the above matched
fixWordDelimiters f (x:xs) = x: fixWordDelimiters f xs

abbreviate :: String -> String
abbreviate xs = map (toUpper . head) $ words $ fixWordDelimiters shouldReplaceWithSpace xs
