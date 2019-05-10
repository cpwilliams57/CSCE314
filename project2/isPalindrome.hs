isPalindrome:: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome xs = 	if xs == reverse xs then True
					else False