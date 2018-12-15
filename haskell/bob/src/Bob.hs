module Bob (responseFor) where

import Data.Char

import qualified Data.Text as T
import           Data.Text (Text)

questionMark :: Text
questionMark = T.pack "?"

-- isQuestion returns True if xs is a question, i.e. it ends with a question mark
isQuestion :: Text -> Bool
isQuestion xs = questionMark `T.isSuffixOf` xs

-- isYelling returns True if all characters available in different case are in the upper case only
isYelling :: Text -> Bool
isYelling xs = T.any isUpper xs && not (T.any isLower xs)

responseFor' :: Text -> String
responseFor' xs
    | (T.null shaved) =  "Fine. Be that way!"
    | (isYelling shaved) && (isQuestion shaved) = "Calm down, I know what I'm doing!"
    | (isQuestion shaved) = "Sure."
    | (isYelling shaved) = "Whoa, chill out!"
    | otherwise = "Whatever."
    where shaved = T.filter (not . isSpace) xs

responseFor :: Text -> Text
responseFor xs = T.pack (responseFor' xs)
