data Ratio = Integer :/ Integer

ratioToFloat :: Ratio -> Float
ratioToFloat (x :/ y) = fromIntegral x / fromIntegral y

main = do print $ ratioToFloat (3 :/ 2)   -- 出力: 1.5
          print $ ratioToFloat (10 :/ 3)  -- 出力: 3.33...
