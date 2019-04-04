module DNA (toRNA) where

rnaTransform :: Char -> Either Char Char
rnaTransform 'C' = Right 'G'
rnaTransform 'G' = Right 'C'
rnaTransform 'A' = Right 'U'
rnaTransform 'T' = Right 'A'
rnaTransform x =  Left x

toRNA :: String -> Either Char String
toRNA = traverse rnaTransform
