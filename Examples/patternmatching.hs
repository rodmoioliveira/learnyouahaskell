factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

addPairs :: Num t => [(t, t)] -> [t]
list = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
addPairs xs = [ a + b | (a,b) <- xs ]
-- addPairs list
-- [4,7,6,8,11,4]

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- pattern xs@(x:y:ys)
capital :: [Char] -> [Char]
capital "" = "Empty string, oops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] ++ " and the rest is " ++ xs
