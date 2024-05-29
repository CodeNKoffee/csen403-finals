-- Non-higher-order function implementation
-- sortOddNumbers' :: [Int] -> [Int]
-- sortOddNumbers' xs = replaceOdds xs (sortOdds (filterOdds xs))
--   where
--     filterOdds [] = []
--     filterOdds (x:xs)
--       | odd x     = x : filterOdds xs
--       | otherwise = filterOdds xs

--     sortOdds [] = []
--     sortOdds (x:xs) = insert x (sortOdds xs)
    
--     insert x [] = [x]
--     insert x (y:ys)
--       | x < y     = x : y : ys
--       | otherwise = y : insert x ys
    
--     replaceOdds [] _ = []
--     replaceOdds (x:xs) sortedOdds
--       | odd x     = head sortedOdds : replaceOdds xs (tail sortedOdds)
--       | otherwise = x : replaceOdds xs sortedOdds

-- Higher-order function implementation
sortOddNumbers2 :: [Int] -> [Int]
sortOddNumbers2 xs = replaceOdds xs (sort (filter odd xs))
  where
    replaceOdds [] _ = []
    replaceOdds (x:xs) sortedOdds
      | odd x     = head sortedOdds : replaceOdds xs (drop 1 sortedOdds)
      | otherwise = x : replaceOdds xs sortedOdds