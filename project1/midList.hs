midList :: [a] -> [a]
midList [] = []
midList [a] = []
midList xs = reverse (tail (reverse (tail xs)))