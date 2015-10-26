mean' :: [Double] -> Double
mean' xs = let (res, len) = foldl (\(m, n) x -> (m + x / len, n + 1)) (0, 0) xs in res

main = do
  let f = print . show
  f (mean' [1.23, 4.5, 6.7, 8.9])
  f (mean' [1, 2, 3])
