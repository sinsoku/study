data Tuple a b = T a b

first :: Tuple a b -> a
first (T x _) = x

second :: Tuple a b -> b
second (T _ y) = y

main = do print $ first (T 1 'a')   -- 出力: 1
          print $ second (T 1 'a')  -- 出力: 'a'
