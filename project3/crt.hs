import Data.List 

--Finds all possile values that could be the solution for tuple
findVals::(Integer,Integer) -> [Integer] 
findVals (a,b) = [ x | x <- [1..367], x `mod` b == a]

--Puts all values into a list of lists 
makeLists::[(Integer,Integer)] -> [[Integer]]
makeLists [] = []
makeLists ((a,b):xs) = findVals (a,b) : makeLists xs

--Finds least common factor of all lists 
lcf:: [[Integer]] -> Integer
lcf xss = head(nub(foldr1 intersect xss)) 

--finds product of b tuple values 
mult:: [(Integer,Integer)] -> Integer
mult [(a,b)] = b 
mult ((a,b):xs)  = b * mult xs 

--creates final tuple 
crt:: [(Integer,Integer)] -> (Integer, Integer)
crt [(a,b)] = (a,b) 
crt xs = ((lcf(makeLists xs)), mult xs ) 