--generates factors for a given number needed for kcomposite
genfactors :: Int -> [Int]
genfactors a = [x | x <- [1..a], a `mod` x == 0]

--finds first composite numbers with k factors 
kcomposite ::  Int -> [Int]
kcomposite k = if k == 0 then [1,2,3,5,7,11,13] --first 7 composite numbers for k=0, will be prime numbers
  else [x | x <- [1..], length (genfactors x) == (k + 2)]