module School (School, add, empty, grade, sorted) where

import Data.List (sortBy)

-- A school is a list of grades, in each grade we have a list of
-- students
data School = Grade Int [String] School | Empty deriving (Show)

add :: Int -> String -> School -> School
add gradeNum student Empty = Grade gradeNum (student : []) Empty
add gradeNum student (Grade num members school)
    | gradeNum == num = Grade gradeNum (student : members) school
    | otherwise = Grade num members (add gradeNum student school)

empty :: School
empty = Empty

grade :: Int -> School -> [String]
grade _ Empty = []
grade gradeNum (Grade num members school)
    | gradeNum == num = members
    | otherwise = grade gradeNum school

unsorted :: School -> [(Int, [String])]
unsorted Empty = []
unsorted (Grade num members school) = (num, members) : sorted school

sorted :: School -> [(Int, [String])]
sorted Empty = []
sorted school = sortBy (\(a,_) (b,_) -> compare a b) (unsorted school)
