data Point = Pt Double Double

norm :: Point -> Double
norm (Pt x y) = sqrt (x * x + y * y)

main = do print $ norm (Pt 3 0)  -- 出力: 3.0
          print $ norm (Pt 1 2)  -- 出力: 2.236...
