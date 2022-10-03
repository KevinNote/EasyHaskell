isPowerOfTwo :: Int -> Bool
isPowerOfTwo x | x == 1 = True
               | even x = isPowerOfTwo (x `div` 2)
               | otherwise = False