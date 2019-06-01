module SumOfMultiples (sumOfMultiples) where

-- nub removes duplicate entries, keeping the first occurrence
import Data.List (union)

-- concat() takes a list of lists and flattens it to a list

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ foldr (union . multiplesBelow themax) [] positiveFactors
    where themax = limit -1
          positiveFactors = filter (>0) factors

-- Generate a list of numbers from x to limit in steps of x
multiplesBelow :: (Num a, Enum a) => a -> a -> [a]
multiplesBelow limit x = [x,2*x..limit]
