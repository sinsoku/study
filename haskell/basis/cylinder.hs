cylinder :: Double -> Double -> Double
cylinder r h = let square x = x * x
                   base = 3.14 * square r
               in h * base

main = print (cylinder 2.0 5.0)  -- 出力: 62.8
