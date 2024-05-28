-- Exercise 3
-- a)
search :: String -> Char -> [Int]
search str goal = [i | (c, i) <- zip str [0..], c == goal]


-- b)
duplicate :: String -> String
duplicate str = concat [[c | _ <- [1..i]] | (c, i) <- zip str [1..]]


-- Exercise 4
-- a)
andRec :: [Bool] -> Bool
andRec [] = True
andRec (x:xs) = x && andRec xs

andHigher :: [Bool] -> Bool
andHigher xs = foldr (&&) True xs


-- b)
unequalsRec :: [(Int, Int)] -> [(Int, Int)]
unequalsRec list = [(x, y)|(x, y) <- list, x /= y]

unequalsHigher :: [(Int, Int)] -> [(Int, Int)]
unequalsHigher ((x, y):xs) = filter (\(x, y) -> x /= y) ((x, y):xs)


-- c)
filterAll :: [a -> Bool] -> [a] -> [a]
filterAll [] list = list
filterAll (f:fs) (x:xs) = filterAll fs (filter f (x:xs))


-- Exercise 5
-- a)
data Tree a = Leaf a | Node a (Tree a) (Tree a)
zipTree :: Tree a -> Tree b -> Tree (a, b)
zipTree (Leaf x) (Leaf y) = Leaf (x, y)
zipTree (Leaf x) (Node y _ _) = Leaf (x, y)
zipTree (Node x _ _) (Leaf y) = Leaf (x, y)
zipTree (Node x left1 right1) (Node y left2 right2) = Node (x, y) (zipTree left1 left2) (zipTree right1 right2)


-- b)
mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f (Leaf x) = Leaf (f x)
mapTree f (Node x left1 right1) = Node (f x) (mapTree f left1) (mapTree f right1)


-- c)
foldrTree :: (a -> b -> b -> b) -> (a -> b) -> Tree a -> b
foldrTree f g (Leaf x) = g x
foldrTree f g (Node x right left) = f x (foldrTree f g right) (foldrTree f g left)