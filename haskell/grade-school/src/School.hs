module School (School, add, empty, grade, sorted) where

import Data.List (sortBy)

-- A school is a list of grades, in each grade we have a list of
-- students. A list is a recursive data structure, so all functions working
-- with Schools are expressed in a recursive manner.
data School = Grade Int [String] School | Empty deriving (Show)

add :: Int -> String -> School -> School
add gradeNum student Empty = Grade gradeNum (student : []) Empty
add gradeNum student (Grade num members school)
    | gradeNum == num = Grade gradeNum sortedStudents school
    | otherwise = Grade num members (add gradeNum student school)
    where sortedStudents = sortBy (\a b -> compare a b) (student : members)

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
