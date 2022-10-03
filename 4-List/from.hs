from :: Int -> [Int]
from x = x : from (x + 1)