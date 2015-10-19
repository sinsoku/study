class Container c where
  cmap :: (a -> b) -> c a -> c b

instance Container Maybe where
-- cmap :: (a -> b) -> Maybe a -> Maybe b
  cmap f Nothing  = Nothing
  cmap f (Just x) = Just (f x)

main = do print $ cmap (2*) Nothing   -- 出力: Nothing
          print $ cmap (2*) (Just 3)  -- 出力: Just 6
