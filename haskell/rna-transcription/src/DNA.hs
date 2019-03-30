module DNA (toRNA) where

rnaTransform :: Char -> Char
rnaTransform 'C' = 'G'
rnaTransform 'G' = 'C'
rnaTransform 'A' = 'U'
rnaTransform 'T' = 'A'
rnaTransform _ = error "BOOM"

dnaNucleotides :: String
dnaNucleotides = "CGAT"

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA xs
    | all (`elem` dnaNucleotides) xs = Right (map rnaTransform xs)
    | otherwise = Left (head $ filter (`notElem` dnaNucleotides) xs)
