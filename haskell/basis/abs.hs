absolute :: Int -> Int
absolute x = if x < 0 then -x else x

main = print (absolute (-5))  -- 出力: 5
