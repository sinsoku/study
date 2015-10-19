power :: Int -> Double -> Double
power 0 _ = 1.0
power x y = y * power (x - 1) y

main = print (power 8 2.0)  -- 出力: 256
