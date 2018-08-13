-- Complete the method which accepts an array of integers, and returns one of the following:

-- "yes, ascending" - if the numbers in the array are sorted in an ascending order
-- "yes, descending" - if the numbers in the array are sorted in a descending order
-- "no" - otherwise

-- You can assume the array will always be valid, and there will always be one correct answer

-- https://www.codewars.com/kata/580a4734d6df748060000045/train/haskell

-- it "[1,2,3,4,5]" $ isSortedAndHow [1,2,3,4,5] `shouldBe` "yes, ascending"
-- it "[1,2,2,4,5]" $ isSortedAndHow [1,2,2,4,5] `shouldBe` "yes, ascending"
-- it "[5,4,3,2,1]" $ isSortedAndHow [5,4,3,2,1] `shouldBe` "yes, descending"
-- it "[5,4,3,3,1]" $ isSortedAndHow [5,4,3,3,1] `shouldBe` "yes, descending"
-- it "[1,2,1,2,1]" $ isSortedAndHow [1,2,1,2,1] `shouldBe` "no"

-- =============================================================
-- Others Solutions
-- =============================================================

isSortedAndHow :: [Int] -> String
isSortedAndHow xs
    | and $ zipWith (<=) xs (tail xs) = "yes, ascending"
    | and $ zipWith (>=) xs (tail xs) = "yes, descending"
    | otherwise                       = "no"


-- isSortedAndHow [1,2,1,2,1]

-- and $ zipWith (<=) [1,2,1,2,1] (tail [1,2,1,2,1])
-- and $ zipWith (<=) [1,2,1,2,1] [2,1,2,1]
-- and [True,False,True,False]
-- False

-- and $ zipWith (>=) [1,2,1,2,1] (tail [1,2,1,2,1])
-- and $ zipWith (>=) [1,2,1,2,1] [2,1,2,1]
-- and [False,True,False,True]
-- False

-- "no"
