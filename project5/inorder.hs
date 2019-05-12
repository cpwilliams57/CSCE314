module Main where 

data Tree a b = Branch b (Tree a b) (Tree a b)
          | Leaf a

--inorder traverses tree in order of (Left, Root, Right)
inorder  :: (a -> c) -> (b -> c) -> Tree a b -> [c]
inorder f g (Leaf a) = [f a]
--this step in the function recursively iterates through a tree 
--and adds elemets to the output array in order of (Left, Root, Right)
inorder f g (Branch b left right) = inorder f g left ++ [g b] ++ inorder f g right