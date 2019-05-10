getFirsts :: [(a,a)] -> [a]
getFirsts [] = []
getFirsts [(a,b)] = [a]
getFirsts [(a,b),(c,d)] = [a,c] 