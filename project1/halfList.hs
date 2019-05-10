halfList :: [a] -> [a]
halfList [] = []
halfList xs = (head xs) : halfListA (tail xs)
halfListA [] = []
halfListA xs = halfList (tail xs)