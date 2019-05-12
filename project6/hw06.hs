module Main where 

data E = IntLit Int
  | BoolLit Bool
  | Plus E E 
  | Minus E E 
  | Multiplies E E 
  | Exponentiate E E 
  | Equals E E 
  deriving (Eq, Show)

--Operate on Nums helps us take the arguements and cast them to the 
--appropriate type for evaluation using the given operator when the function
--is called from its use in eval
--This function is credited to Jack Clark 
operateOnNums :: (E -> E -> E) 
              -> (Int -> Int -> Int) 
              -> E -> E -> E
operateOnNums f g a b = 
 let a' = (eval a)
     b' = (eval b)
 in case (a', b') of 
    (IntLit a'', IntLit b'') -> IntLit(g a'' b'')
    _                        -> f a' b'

eval :: E -> E
eval (IntLit a) = IntLit a --This states that an argument will be an int 
eval (BoolLit a) = BoolLit a --This states that an arguement will be a bool 
eval (Plus a b) = operateOnNums Plus (+) a b -- adds two IntLits
eval (Minus a b) = operateOnNums Minus (-) a b --Subtracts two IntLits
eval (Multiplies a b) = operateOnNums Multiplies (*) a b --Multiplies 2 intLits
eval (Exponentiate a b) = operateOnNums Exponentiate (^) a b
eval (Equals a b) = --determines if two IntLits are equal 
 let a' = (eval a)
     b' = (eval b) 
 in case (a', b') of 
    (IntLit a'', IntLit b'') -> BoolLit (a'' == b'')
    (BoolLit a'', BoolLit b'') -> BoolLit (a'' == b'')
