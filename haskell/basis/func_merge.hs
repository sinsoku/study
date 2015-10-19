add :: Int -> Int
double :: Int -> Int

add a = a + 1
double x = x * 2

-- f = add . double
f = double . add

-- main = do { print (add 3); print (double 1) }
main = print (f 3)
