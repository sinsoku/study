data Person = Person { name :: String, age :: Int }

inc :: Person -> Person
inc p = let newage = age p + 1 in p { age = newage }

taro = Person "Taro" 25

main = do print $ name $ inc taro  -- 出力: "Taro"
          print $ age $ inc taro   -- 出力: 26
