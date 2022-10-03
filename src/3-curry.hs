addUnCurry :: (Int, Int, Int) -> Int
addUnCurry (x, y, z) = x + y + z

addCurry :: Int -> Int -> Int -> Int
addCurry x y z = x + y + z


addTwo :: Int -> Int -> Int
addTwo = addCurry 0