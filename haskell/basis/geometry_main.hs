import Data.Geometry

main = do print $ width (Rect 3 4)   -- 出力: 3.0
          print $ height (Rect 3 4)  -- 出力: 4.0
          print $ area (Tri 3 4)     -- 出力: 6.0
          print $ area (Rect 3 4)    -- 出力: 12.0
