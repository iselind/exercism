module SumOfMultiples (sumOfMultiples) where

-- is a a factor in b?
isFactorOf :: Integer -> Integer -> Bool
isFactorOf a b = b `mod` a == 0

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = error "You need to implement this function."


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
