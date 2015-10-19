data Point = Pt Double Double deriving Eq

main = do print $ (Pt 1 2) == (Pt 1 2)  -- 出力: True
          print $ (Pt 1 2) == (Pt 2 3)  -- 出力: False
