module Main where 

measureWater :: Int -> Int -> Int -> Bool
						
						--It is not possible for 2 jugs to contain more than 
						--their combined capacity
measureWater a b c = 	if (c > a + b) then False
						--if one of the jugs measures the entire capacity
						--then you just fill that one jug
						else if (c == a) || (c == b) then True 
						--if one of the jug capcities is zero and the final capacity
						-- is less than the other jug, it is not possible 
						else if ((a == 0) && (c < b)) || ((b == 0) && (c < a)) then False 
						--if the sum of the two jugs is a factor of the final capacity
						--it is possible to empty and pour in a order sch that the
						--final capacity will be reached s
						else if ((a + b) `mod` c) == 0 then True 
						else False    