

-- Exercise 1
-- a) [0,3..10] = [1,3,5,7,9]
-- b) :t (1,"3",2.0) = (Fractional c, Num a) => (a, String, c)
-- c) :t [1, 2.0, "3"] = Error, since you're trying to create a list with elements of different types. In Haskell, lists are homogenous meaning that all its elements must be of the same type
-- d) foldr (*) 10 (map length ["GUC", "Hello", "MET"]) = 450
-- e) filter (\(x, y)-> (x + y < 7)) (zip [1, 2, 3, 4] [5, 6, 7]) = [(1, 5)]


-- Exercise 2
-- a)
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
sumAbsDiffs :: [Int] -> Int
sumAbsDiffs [] = 0
sumAbsDiffs [_] = 0
sumAbsDiffs (x:y:xs) = abs (y - x) + sumAbsDiffs (y:xs)


-- b)
sumAbsDiffs list = sum [abs (y - x) | (x, y) <- zip list (drop 1 list)] -- You can use the `tail` instead of `drop`


-- c)
sameSumAbsDiff :: [[Int]] -> Bool
sameSumAbsDiff [] = True
sameSumAbsDiff [_] = True
sameSumAbsDiff ((x:xs):(y:ys):rest) = sumAbsDiffs (x:xs) == sumAbsDiffs (y:ys) && sameSumAbsDiff ((y:ys):rest)

