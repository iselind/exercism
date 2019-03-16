module CollatzConjecture (collatz) where

-- The only case where Nothing is returned is for zero and negative numbers.
-- Otherwise we always get a sane value. I think it would complicate the
-- calculations to include the Maybe type in it, so I split collatz in two. One
-- part takes care of checking if inparameter is more than zero, and the other
-- part takes care of the actual calculations.

collatz' :: Integer -> Integer
collatz' 1 = 0
collatz' x
    | (x `mod` 2 == 0) = (1 + (collatz' (x `div` 2)))
    | otherwise = (1 + (collatz' (3*x+1)))

collatz :: Integer -> Maybe Integer
collatz x
    | (x < 1) = Nothing
    | otherwise = Just (collatz' x)
