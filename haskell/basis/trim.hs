trim :: [Char] -> [Char]
trim str@(c:cs) | c == '0'  = trim cs
                | otherwise = str

main = putStrLn (trim "00123")  -- 出力: 123
