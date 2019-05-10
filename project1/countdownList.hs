countdownList:: Int -> Int -> [Int] 
countdownList x y = if x > y then []
	else reverse [x..y]