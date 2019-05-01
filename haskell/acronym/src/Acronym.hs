module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate xs = map (toUpper . head) $ words xs
