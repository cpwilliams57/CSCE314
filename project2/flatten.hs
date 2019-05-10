flatten:: [[a]] -> [a]
flatten [] = []
flatten [[a]] = [a] 
flatten xss = foldr (++) [] xss