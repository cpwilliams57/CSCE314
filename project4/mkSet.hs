--Write a recursive function that constructs a set.
module main where 
	
type Set a = [a]
mkSet :: Eq a => [a] -> Set a

--this makes a set from the input and removes duplicate 
--values using filter 
mkSet [] = [] 
mkSet [a] = [a]
mkSet (x:xs) = x : mkSet (filter (/= x) xs)