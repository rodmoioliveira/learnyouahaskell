timesThree :: Num b => [b] -> [b]
timesThree xs = map (*3) xs
-- Point Free
timesThree' :: Num b => [b] -> [b]
timesThree' = map (*3)
-- Lambda
timesThree'' :: Num b => [b] -> [b]
timesThree'' = map (\x -> x * 3)
-- List comprehension
timesThree''' :: Num b => [b] -> [b]
timesThree''' xs = [ x*3 | x <- xs ]

-- Folds
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- Function application
sumBiggerThan10 :: (Num a, Ord a) => [a] -> a
sumBiggerThan10 xs = sum (filter (> 10) (map (*2) xs))
-- Function application with $
sumBiggerThan10' :: (Num a, Ord a) => [a] -> a
sumBiggerThan10' xs = sum $ filter (> 10) $ map (*2) xs
-- Composition
sumBiggerThan10'' :: (Num a, Ord a) => [a] -> a
sumBiggerThan10'' = sum . filter (> 10) . map (*2)

-- Lambda
same :: [Integer]
same = map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
-- Composition
same' :: [Integer]
same' = map (negate . sum . tail) [[1..5],[3..6],[1..7]]

-- Usual
mathOperations :: (Floating a, Integral b, RealFrac a) => a -> b
mathOperations x = ceiling (negate (tan (cos (max 50 x))))
-- Function application with $
mathOperations' :: (Floating a, Integral b, RealFrac a) => a -> b
mathOperations' x = ceiling $ negate $ tan $ cos $ max 50 x
-- Composition and point free
mathOperations'' :: (Floating a, Integral b, RealFrac a) => a -> b
mathOperations'' = ceiling . negate . tan . cos . max 50
