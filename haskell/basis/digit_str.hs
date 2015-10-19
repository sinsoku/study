newtype DigitString = DigitStr String

atoi :: DigitString -> Int
atoi (DigitStr xs) = read xs

main = print $ atoi (DigitStr "0123")  -- 出力: 123
