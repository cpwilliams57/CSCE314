rotate:: [a] -> Int -> [a]
rotate [] a = []
rotate [b] a = [b]
rotate xs a = if a > (length xs) then drop (a - length xs) xs ++ take (a - length xs) xs
	 			else drop a xs ++ take a xs 

