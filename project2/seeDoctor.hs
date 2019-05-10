import Data.List 
seeDoctor:: [Char] -> [Char] -> Bool
seeDoctor [][] = True
seeDoctor a b = if (a == "") && (b == "h") then True 
				else if (a == "h") && (b == "h") then True 
				else if all (\c -> c == 'a' || c == 'h') a 
					&& all (\c -> c == 'a' || c == 'h') b
					&& drop ((length b ) - 2) b  == "ah" 
					&& isInfixOf a b then True else False 