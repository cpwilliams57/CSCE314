sumSeries:: [Int] -> Int
sumSeries [] = 0
sumSeries xs = (head xs) + sumSeriesA (tail xs) 
sumSeriesA xs = (head xs) + sumSeries(tail xs)