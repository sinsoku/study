module Data.Geometry where

data Shape = Tri { base, height:: Double }
           | Rect { width, height :: Double }

area :: Shape -> Double
area (Tri x y)  = x * y / 2
area (Rect x y) = x * y
