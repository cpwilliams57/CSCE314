--The partition of a set S is defined as a set of nonempty, 
--pairwise disjoint subsets of S whose union is S. For example, 
--the set {red, green, blue} can be partitioned in 5 ways:

--Write a Haskell function to compute the partition of any set provided
-- as input. (The colors are just to help you see the pattern; your code isn't 
--expected to produce the colored output.)
module main where 

type Set a = [a]
partitionSet :: Eq t => Set t -> Set( Set (Set t))

--This helper function takes a set and turns it into a list of 
--list of list 
--https://stackoverflow.com/questions/35423903/haskell-all-possible-partitions-of-a-list
bloat :: a -> [[a]] -> [[[a]]]
bloat x  []      = [[[x]]]
bloat x (xs:xss) = ((x:xs):xss) : map (xs:) (bloat x xss)

--this is the partition set function, it takes xs, and maps eveery 
--possible combination in xs into a list of lists 
partitionSet  []    = [[]]
partitionSet (x:xs) = [ys | yss <- partitionSet xs, ys <- bloat x yss]