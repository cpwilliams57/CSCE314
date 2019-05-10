isElement:: (Eq a) => a -> [a] -> Bool
isElement a [] = False
isElement a (x:xs) = if a ==x then True
	else isElement a xs