module Main where 

data Tree a b = Branch b (Tree a b) (Tree a b)
          | Leaf a


--pre order traverses tree in the order of (Left, Right, Root)
postorder  :: (a -> c) -> (b -> c) -> Tree a b -> [c]
postorder f g (Leaf a) = [f a]
--this step in the function recursively iterates through a tree 
--and adds elemets to the output array in order of (Left, Right, Root)
postorder f g (Branch b left right) = postorder f g left ++ postorder f g right ++ [g b]