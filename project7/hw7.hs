module Main where

import Prelude

import Test.HUnit   -- for testing
import System.Exit  -- defines exitFailure

--Wvalues consist of VInts (Ints), VBools (Bools), and VMarkers 
data WValue = VInt Int
            | VBool Bool
            | VMarker
              deriving (Eq, Show)

--W expressions (WExp) are comprised of Wvalues
--W expressions represent the basic operations that can be peformed 
--Plus, Minus, Multiply, Equals, NotEqual, Less, Greater ...
data WExp = Val WValue
          | Var String
          | Plus WExp WExp
          | Mult WExp WExp
          | Equals      WExp WExp
          | NotEqual    WExp WExp
          | Less        WExp WExp
          | Greater     WExp WExp
          | LessOrEq    WExp WExp
          | GreaterOrEq WExp WExp
          | And  WExp WExp
          | Or   WExp WExp
          | Not  WExp
            deriving Show

--W statements are comprised of WExpressions
--W expressions allow us to evaluate W expressions 
data WStmt = Empty
           | VarDecl String WExp 	--Performing a simple variable Declaration
           | Assign  String WExp 	--Performing variable assignment 
           | If      WExp   WStmt WStmt 	--if statement 
           | While   WExp   WStmt 			--While statement 
           | Block  [WStmt] 	--A block is a series of Wstatements 
             deriving Show

--Memory is an array consisting of name, value tuples 
type Memory = [(String, WValue)] 	
marker = ("|", VMarker)
isMarker (x, _) = (x == "|")

--Defining the different operations evailable in eval..
--We need to give a WEexp, a Memory and are returned a Wvalue 
eval :: WExp -> Memory -> WValue
--If only a vale is given, the value is returned 
eval (Val v) _ = v
--if we are given a variable and a memory, 
eval (Var s) m = case memoryLookup s m of
                      Just v -> v
                      Nothing -> error ("Unknown variable " ++ s)
--Handles the addition operation of two numbers                       
eval (Plus e1 e2) m = let e1' = eval e1 m --e1 value and memory
                          e2' = eval e2 m -- e2 value and memory
                      in VInt (assignInt e1' + assignInt e2') --performs operation
--Handles Multiplication Operation                      
eval (Mult e1 e2) m = let e1' = eval e1 m --e1 value and memory
                          e2' = eval e2 m -- e2 value and memory
                      in VInt (assignInt e1' * assignInt e2')--performs operation
--Handles Multiplication Operation 
eval (Equals e1 e2) m = let e1' = eval e1 m --e1 value and memory
                            e2' = eval e2 m -- e2 value and memory
                        in VBool (e1' == e2') --performs operation
--Handles the not equals comparison of 2 numbers                        
eval (NotEqual e1 e2) m = VBool ( not (assignBool (eval (Equals e1 e2) m)))
eval (Less e1 e2) m = let e1' = eval e1 m --e1 value and memory
                          e2' = eval e2 m -- e2 value and memory
                      in VBool (assignInt e1' < assignInt e2') --performs operation
--Handles the less than or equal comparison of two numbers                       
eval (LessOrEq e1 e2) m = let e1' = eval e1 m --e1 value and memory
                              e2' = eval e2 m -- e2 value and memory
                          in VBool $ assignInt e1' <= assignInt e2' --performs operation
--Handles greather than comparison of two numbers                           
eval (Greater e1 e2) m = let e1' = eval e1 m--e1 value and memory
                             e2' = eval e2 m-- e2 value and memory
                         in VBool (assignInt e1' > assignInt e2')--performs operation
--Handles the greater than or equal to comparison of two numbers 
eval (GreaterOrEq e1 e2) m = let e1' = eval e1 m--e1 value and memory
                                 e2' = eval e2 m-- e2 value and memory
                             in VBool (assignInt e1' >= assignInt e2')--performs operation
--Handles the and comparison operator of two values                             
eval (And e1 e2) m | not (assignBool (eval e1 m)) = VBool False
                   | otherwise = VBool (assignBool (eval e2 m))
 --Handles the or comparison operator of two values                   
eval (Or e1 e2) m | assignBool (eval e1 m) = VBool True
                  | otherwise = VBool (assignBool (eval e2 m))
 --Handles the not operation                    
eval (Not e) m = VBool ( not (assignBool (eval e m)) )

--Determining if a variable is defined 
definedInCurrScope _ [] = False
definedInCurrScope s (x:xs)
   | isMarker x   = False --if x is a marker then false 
   | s == (fst x) = True 
   | otherwise  = definedInCurrScope s xs --recursively search the list 

--Determining if two memories are the same kind 
sameKind (VInt  _) (_, (VInt  _)) = True
sameKind (VBool _) (_, (VBool _)) = True
sameKind        _             _   = False

--This frunction replaces the first definition of a variable if found 
replaceFirstDefFound s _ [] = error ("Cannot assign undefined variable " ++ s) --for undefined variable
replaceFirstDefFound s v (x:xs)
   | s == (fst x) =
       if sameKind v x then
          ((fst x), v) : xs
       else
          error ("Type error in assignment of " ++ s)
   | otherwise    =
       (x : (replaceFirstDefFound s v xs))

execBlock []     m = deleteMemoryToMarker m
execBlock (s:ss) m = execBlock ss (exec s m)

--This funcion deletes all memory associated with a certain marker 
deleteMemoryToMarker [] = []
deleteMemoryToMarker (m:ms)
   | isMarker m = ms
   | otherwise  = deleteMemoryToMarker ms --recursively delete the memory assiciated 

--The exec function takes a Wstmt, Memory and returns a memory 
exec :: WStmt -> Memory -> Memory

--the exec of an empty statememt wil return the value by itself 
exec Empty m = m
--Handling the execution of a variable declaration 
exec (VarDecl s e) m
   | not (definedInCurrScope s m) = (s, eval e m) : m
   | otherwise = error ("Var " ++ s ++ " already defined in current scope.")
--Handling the execution of vaariable assignment 
exec (Assign s e) m = replaceFirstDefFound s (eval e m) m
--Handling the execution of an if statement 
exec (If e s1 s2) m
   | (eval e m) == (VBool True)  = exec s1 m
   | (eval e m) == (VBool False) = exec s2 m
   | otherwise  =  error ("Non-boolean in condition of if statement.")
--Handling the execution of a while statement 
exec (While e s) m
   | (eval e m) == (VBool True)  = exec (While e s) (exec s m)
   | (eval e m) == (VBool False) = m
   | otherwise  =  error ("Non-boolean in condition of while statement.")
--Handling the execution of a code block 
exec (Block ss) m = execBlock ss (marker : m)


factorial = Block
  [
     VarDecl "acc" (Val (VInt 1)),
     While (Greater (Var "arg") (Val (VInt 0)))
     ( Block
       [ Assign "acc" (Mult (Var "acc") (Var "arg")),
         Assign "arg" (Plus (Var "arg") (Val (VInt (-1))))         
       ]
     ),
     Assign "result" (Var "acc")
  ]

fac02 = exec factorial [("result", (VInt 0)), ("arg", (VInt  2))]
fac10 = exec factorial [("result", (VInt 0)), ("arg", (VInt 10))]
fac20 = exec factorial [("result", (VInt 0)), ("arg", (VInt 20))]
fac30 = exec factorial [("result", (VInt 0)), ("arg", (VInt 30))]
fac40 = exec factorial [("result", (VInt 0)), ("arg", (VInt 40))]
fac50 = exec factorial [("result", (VInt 0)), ("arg", (VInt 50))]
fac100 = exec factorial [("result", (VInt 0)), ("arg", (VInt 100))]

--memoryLookup takes is a string and an array of tuples
memoryLookup s [] = Nothing -- if the array is empty, nothing is returned
memoryLookup s ((k,v):xs)
   | s == k    = Just v --if the names match, return v 
   | otherwise = memoryLookup s xs --if not, search the list recursively

--Assign int helps deal with integer assignment 
assignInt (VInt v) = v --Return the interger v 
assignInt x = error ("Expected a number, got " ++ show x)

--Helps deal with the assignment of boolean variables 
assignBool (VBool v) = v --Return the boolean value of v 
assignBool x = error ("Expected a boolean, got " ++ show x)

--I'm not completely sure what the purpose of the fromJust function is 
fromJust (Just v) = v
fromJust Nothing = error "Expected a value in Maybe, but got Nothing"

--
-- unit tests
--
myTestList =
  TestList [
    test ( assertEqual "prog1 test" [] (exec prog1 []) ),

    let res = memoryLookup "result" (
                exec factorial [("result", VInt (-1)), ("arg", VInt 10)])
    in
     test (assertBool "factorial of 10" (3628800 == assignInt (fromJust res)))
    ]    

--
-- main: run the unit tests  
--
main = do c <- runTestTT myTestList
          putStrLn (show c)
          let errs = errors c
              fails = failures c
          if (errs + fails /= 0) then exitFailure else return ()
