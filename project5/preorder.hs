module Main where 

data Tree a b = Branch b (Tree a b) (Tree a b)
          | Leaf a


--pre order traverses tree in the order of (Root, Left, Right)
preorder  :: (a -> c) -> (b -> c) -> Tree a b -> [c]
preorder f g (Leaf a) = [f a]
--this step in the function recursively iterates through a tree 
--and adds elemets to the output array in order of (root, left, right)
preorder f g (Branch b left right) = [g b] ++ preorder f g left ++ preorder f g right