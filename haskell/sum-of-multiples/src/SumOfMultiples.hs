module SumOfMultiples (sumOfMultiples) where

-- nub removes duplicate entries, keeping the first occurrence
import Data.List (nub)

-- concat() takes a list of lists and flattens it to a list

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concatMap (mylist themax) filteredFactors
    where themax = limit -1
          filteredFactors = filter (>0) factors

-- Generate a list of numbers from x to limit in steps of x
mylist :: (Num a, Enum a) => a -> a -> [a]
mylist limit x = [x,2*x..limit]
