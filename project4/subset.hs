--Write a recursive function subset, such that subset a b returns 
--True if a is a subset of b and False otherwise. (Hint: you should write a 
--function that can determine if some value is a member of a set.)
module main where 

type Set a = [a]
subset :: Eq a => Set a -> Set a -> Bool

--empty element cases 
subset [] [] = True 
subset [] [a] = True
subset [a] [] = False 

--checks to see if all elements in xs are present in ys 
subset xs ys = and [elem x ys | x <- xs]