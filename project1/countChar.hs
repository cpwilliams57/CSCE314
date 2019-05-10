countChar:: Char -> [Char] -> Int 
countChar a [] = 0 
countChar a xs = length $ filter (== a) xs 