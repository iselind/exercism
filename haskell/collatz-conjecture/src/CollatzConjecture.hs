module CollatzConjecture (collatz) where

next :: Integer -> Integer
next x
    | (even x) = x `quot` 2
    | otherwise = 3*x+1

collatz :: Integer -> Maybe Integer
collatz x
    | (x < 1) = Nothing
    | otherwise = Just (toInteger answer)
    where answer = length $ takeWhile (/= 1) $ (iterate next x)
