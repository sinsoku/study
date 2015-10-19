data Point = Pt2D Double Double | Pt3D Double Double Double

norm :: Point -> Double
norm (Pt2D x y)   = sqrt (x * x + y * y)
norm (Pt3D x y z) = sqrt (x * x + y * y + z * z)

main = do print $ norm (Pt2D 1 2)    -- 出力: 2.236...
          print $ norm (Pt3D 0 1 2)  -- 出力: 2.236...
