power :: Int -> Double -> Double
power x y = case (x, y) of
    (0, _)             -> 1.0
    (x, y) | x > 0     -> y * power (x - 1) y
           | otherwise -> 1.0 / power (- x) y

main = print (power 3 3)
