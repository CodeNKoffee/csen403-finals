-- Exercise 3
-- a)
search :: String -> Char -> [Int]
search str goal = [i | (c, i) <- zip str [0..], c == goal]


-- b)
duplicate :: String -> String
duplicate str = concat [[c | _ <- [1..i]] | (c, i) <- zip str [1..]]


-- Exercise 4
