multComplex:: (Float,Float) -> (Float,Float) -> (Float,Float)
multComplex (a,b) (c,d) = (a*c - b*d, a*d + b*c)