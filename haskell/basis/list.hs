data List a = Cons a (List a) | Nil

length' :: List a -> Int
length' Nil         = 0
length' (Cons x xs) = 1 + length' xs

main = do print $ length' Nil                             -- 出力: 0
          print $ length' $ Cons 1 (Cons 2 (Cons 3 Nil))  -- 出力: 3
