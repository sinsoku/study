data Point = Pt Double Double

instance Eq Point where
  (Pt x y) == (Pt x' y') = x == x' && y == y'

main = do print $ (Pt 1 2) == (Pt 2 3)  -- 出力: False
          print $ (Pt 1 2) /= (Pt 2 3)  -- 出力: True
          print $ (Pt 1 2) == (Pt 1 2)  -- 出力: True
