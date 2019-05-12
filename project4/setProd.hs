--The product of two sets A and B is the set consisting 
--of all pairs draw from either set, where the pairs are ordered 
--having elements (ai, bj). The first element is from A and the second from B.
module main where 

type Set a = [a]
setProd :: (Eq t, Eq t1) => Set t -> Set t1 -> Set (t, t1)

--takes tws sets, xs & ys
-- outputs a list of touples containing pairs comprised of all
--elements in both sets 
setProd xs ys = [(x,y) | x <- xs, y <- ys]