-- https://www.codewars.com/kata/remove-the-minimum/train/haskell

import Data.List

removeSmallest :: Ord t => [t] -> [t]
removeSmallest [] = []
removeSmallest xs = xs \\ (minimum xs : [])

-- =============================================================
-- Others Solutions
-- =============================================================

-- import Data.List (delete)

-- removeSmallest :: Ord a => [a] -> [a]
-- removeSmallest xs = delete (minimum xs) xs

-- =============================================================

-- import Data.List (delete)

-- removeSmallest :: [Int] -> [Int]
-- removeSmallest = delete =<< minimum        MONAD!!!!!!!!!!!!!

-- =============================================================

-- removeSmallest :: [Int] -> [Int]
-- removeSmallest xs = xs \\ [minimum xs]
