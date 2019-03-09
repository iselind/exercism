module Diamond (diamond) where

import Data.List

alphabet :: String
alphabet = ['A'..'Z']

charPos :: Char -> Maybe Int
charPos x = elemIndex x alphabet

createBase :: Int -> [String]
createBase n = replicate m (replicate m ' ')
    where m = 2*n+1

diamond' :: Char -> Int -> (Maybe Int) -> Maybe String
diamond' _ _ Nothing = Nothing
diamond' c level pos = Just [c]

diamond :: Char -> Maybe [String]
diamond c = Just ( [c] : [])
