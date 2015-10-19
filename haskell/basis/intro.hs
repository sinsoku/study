data Person = Person { name :: String, age :: Int }

intro1 :: Person -> String
intro1 (Person n a) = "My name is " ++ n ++ "."

intro2 :: Person -> String
intro2 (Person { name = n }) = "My name is " ++ n ++ "."

taro = Person "Taro" 25

main = do putStrLn $ intro1 taro    -- 出力: My name is Taro.
          putStrLn $ intro2 taro    -- 出力: My name is Taro.
