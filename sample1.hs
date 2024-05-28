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