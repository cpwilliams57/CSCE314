altSeries :: [Double] -> Double
altSeries [] = 0
altSeries xs = (head xs) - altSeriesA (tail xs)
altSeriesA [] = 0
altSeriesA xs = (head xs) - altSeries (tail xs)

