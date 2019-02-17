module Diamond (diamond) where

diamond :: Char -> Maybe [String]
diamond c = Just ( [c] : [])
