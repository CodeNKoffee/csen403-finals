

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


-- Exercise 3
-- Define some sample ingredients
ingredient1 = I "Tomato" 2.0
ingredient2 = I "Cheese" 1.5
ingredient3 = I "Bread" 1.0
ingredient4 = I "Lettuce" 0.5
ingredient5 = I "Chicken" 2.5

-- Define some sample dishes
dish1 = D "Cheese Sandwich" [ingredient2, ingredient3] 5.0
dish2 = D "Chicken Salad" [ingredient4, ingredient5] 7.5
dish3 = D "Tomato Soup" [ingredient1, ingredient2] 4.0
dish4 = D "Veggie Burger" [ingredient1, ingredient4, ingredient3] 6.0

-- Define a sample menu
menu = [dish1, dish2, dish3, dish4]

-- a)
data Ingredient = I String Double deriving Show


-- b)
data Dish = D String [Ingredient] Double deriving Show


-- c)
type Menu = [Dish] 


-- d)
parseIngredient :: String -> Ingredient
parseIngredient s = I name quantity where (name, quantity) = parseString s []
parseString :: [Char] -> [Char] -> ([Char], Double)
parseString (h:t) b = if h == ' ' then (b, read t :: Double) else parseString t (b ++ [h])


-- e)
calculateTotalPrice :: Menu -> Double
calculateTotalPrice [] = 0
calculateTotalPrice ((D _ _ d):t) = d + calculateTotalPrice t


-- f)
findDishesWithIngredient :: Menu -> String -> [String]
findDishesWithIngredient [] _ = []
findDishesWithIngredient ((D dishName ing _):t) goal
  | any (\(I name _) -> name == goal) ing = dishName : findDishesWithIngredient t goal
  | otherwise = findDishesWithIngredient t goal


-- Exercise 6
-- b)
count :: (Num a1, Eq a2) => [a2] -> a2 -> a1
count list target = sum [1 | num <- list, num == target]

-- alternative
count2 list target = length (filter (==target) list) 
