--Using subset you have already defined, write a function setEqual that returns True if the two sets 
--contain exactly the same elements, and False otherwise.
module main where 

type Set a = [a]
setEqual :: Eq a => Set a -> Set a -> Bool

--two empty inputs case
setEqual [] [] = True 

--1st input is empty with one element
setEqual [] [a] = False

--2nd input is empty with one element 
setEqual [a] [] = False 

--1st input empty with a set input
setEqual [] xs = False

--compares all elements in xs and ys, outputs true if all
--are present
setEqual xs ys = all (`elem` ys) xs
