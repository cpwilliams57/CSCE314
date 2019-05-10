import Data.Char

charType:: Char -> (Bool,Bool,Bool)
charType x | isNumber x = (False,False,True)
                | isUpper x = (True,False,False)
                | isLower x = (False,True,False)
                | otherwise = (False,False,False)



uppercaseList :: [Char] -> [(Bool,Bool,Bool)]
uppercaseList [] = []
uppercaseList (x:xs) = (charType x:uppercaseList xs)