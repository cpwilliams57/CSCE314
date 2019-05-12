type Move = Char;

rps :: Move -> Move -> Int 
rps p1 p2 = if (p1 == 'R') && (p2 == 'S') then 1 ;
			else if (p1 == 'R') && (p2 == 'P') then 2 ;
			else if (p1 == 'S') && (p2 == 'R') then 2 ;
			else if (p1 == 'P') && (p2 == 'R') then 1;
			else 0; 