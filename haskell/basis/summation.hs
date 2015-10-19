summation :: (Int -> Int) -> Int -> Int
summation f 1 = f 1
summation f n = f n + summation f (n - 1)

square :: Int -> Int
square x = x * x

main = print (summation square 3)  -- 出力: 14
