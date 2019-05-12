import Data.List 
--list of 2 composites 
twoComps = [6,8,10,14,15,21,22,26,27,33,34,35,38,39,46,51,55,57,58,62,63,65,69,74,77,82,85,86,87,92,93,94]
factors n = [x | x <- [1..n], n `mod` x == 0]

--determines if composite and makes composite if not 
isComp::[Char] -> [Char]
isComp [] = []
isComp xs = if length xs `elem` twoComps then xs
			else isComp (xs ++ "X")  

--splits string into a block 
splitEvery :: Int -> [Char] -> [[Char]]
splitEvery n = takeWhile (not.null) . map (take n) . iterate (drop n)

--produces new anagram 
new:: [[Char]] -> Int -> Int ->[Char]
new [] a b= []
new [xs] a b = [xs!!b]
new xs a b = [(xs!!y!!x)| x<-[0..b], y<-[0..a]]

--find rows
rows :: [Char] -> Int
rows [] = 0
rows xs = (factors(length xs))!! 1 

--find cols 
cols :: [Char] -> Int
cols [] = 0 
cols xs = (factors(length xs))!! 2 


--puts functions together 
anagramEncode :: [Char] -> [Char]
anagramEncode [] = "XXXXXX"
anagramEncode [a] = [a]
anagramEncode xs = new (splitEvery (cols (isComp xs)) (isComp xs)) (rows (isComp xs) - 1 ) (cols (isComp xs) - 1 )


