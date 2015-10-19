prod :: [Int] -> Int
prod []     = 1
prod (x:xs) = x * prod xs

main = print (prod [1, 2, 3, 4, 5])  -- 出力: 120
