isRight:: Int -> Int -> Int -> Bool
isRight a b c = if a == 0 then False 
	else if (a^2) + (b^2) == (c^2) then True 
		else False 