module CollatzConjecture (collatz) where

next :: Integer -> Integer
next x
    | (even x) = x `quot` 2
    | otherwise = 3*x+1

collatz' :: Integer -> Integer
collatz' = toInteger . length . (takeWhile (/= 1)) . (iterate next)

collatz :: Integer -> Maybe Integer
collatz x
    | (x < 1) = Nothing
    | otherwise = Just (collatz' x)
