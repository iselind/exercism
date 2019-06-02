module Grains (square, total) where

squareCount :: [Integer]
squareCount = iterate (2*) 1

squareCountList :: Int -> [Integer]
squareCountList n = take n squareCount

square :: Int -> Maybe Integer
square n
    | n < 1 = Nothing
    | n > 64 = Nothing
    | otherwise = Just (last $ squareCountList n)

total :: Integer
total = sum $ squareCountList 64
