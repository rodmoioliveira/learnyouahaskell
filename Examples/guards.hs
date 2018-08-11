-- guards
age :: (Num a, Ord a) => a -> [Char]
age x
  | x <= 15 = "Muito jovem!"
  | x <= 18 = "Adolescente!"
  | x <= 30 = "Jovem adulto"
  | x <= 50 = "Meia Idade"
  | otherwise = "Velho"

max' :: (Ord a) => a -> a -> a
a `max'` b
  | a > b = a
  | otherwise = b

myCompare' :: (Ord a) => a -> a -> Ordering
a `myCompare'` b
  | a > b     = GT
  | a == b    = EQ
  | otherwise = LT
