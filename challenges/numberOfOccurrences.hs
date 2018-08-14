-- https://www.codewars.com/kata/52829c5fe08baf7edc00122b/train/haskell
-- Write a functionthat returns the number of occurrences of an element in an array.

-- Examples
sample = [0, 1, 2, 2, 3]
-- numberOfOccurrences 0 sample `shouldBe` 1
-- numberOfOccurrences 4 sample `shouldBe` 0
-- numberOfOccurrences 2 sample `shouldBe` 2

numberOfOccurrences :: Eq a => a -> [a] -> Int
numberOfOccurrences x xs = length [ n | n <- xs, n == x ]

numberOfOccurrences' :: Eq a => a -> [a] -> Int
numberOfOccurrences' x xs = length $ filter (\n -> n == x) xs

numberOfOccurrences'' :: Eq a => a -> [a] -> Int
numberOfOccurrences'' x (n:xs)
  | x == n = 1 + numberOfOccurrences x xs
  | otherwise = numberOfOccurrences x xs
