-- 非正格
if'  p x y = if p then x else y

-- 正格
if'' p x y = p `seq` x `seq` y `seq`  -- p, x, y を評価
             if p then x else y

main = do print $ if'  True 1 (1 `div` 0)  -- 出力: 1
          print $ if'' True 1 (1 `div` 0)  -- 例外発生
