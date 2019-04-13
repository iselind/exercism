module SumOfMultiples (sumOfMultiples) where

import Data.List

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concat $ map (mylist (limit-1)) factors

mylist :: (Num a, Enum a) => a -> a -> [a]
mylist limit x = [x,2*x..limit]

-- Produce a list of predicate functions
-- map isFactorOf [3,5]

-- If any of the predicate functions produce true for the remaining parameter,
-- return the remaining parameter

-- > :t any
-- any :: Foldable t => (a -> Bool) -> t a -> Bool

-- > (map isFactorOf [3,5]) <*> [1..20]
-- [False,False,True,False,False,True,False,False,True,False,False,True,False,False,True,False,False,True,False,False,False,False,False,False,True,False,False,False,False,True,False,False,False,False,True,False,False,False,False,True]

-- For natural numbers BELOW 20, multiples of 3 or 5
-- sum ([ x | x <- [1..19], y <- (map isFactorOf [3,5]), y x == True])
-- This gets you 93, which is 15 to much
