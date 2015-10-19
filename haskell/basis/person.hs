data Person = Person { name :: String, age :: Int }

taro1 = Person "Taro" 25
taro2 = Person { age = 21, name = "Jiro" }

main = do print $ name taro1  -- 出力: "Taro"
          print $ age taro1   -- 出力: 25
          print $ name taro2  -- 出力: "Jiro"
          print $ age taro2   -- 出力: 21
