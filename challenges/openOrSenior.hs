-- https://www.codewars.com/kata/categorize-new-member/train/haskell

data Membership = Open | Senior deriving (Eq, Show)

openOrSenior :: [(Int, Int)] -> [Membership]
openOrSenior [] = []
openOrSenior xs = [(result x y) | (x,y) <- xs, let result a b = if (a >= 55) && (b > 7) then Senior else Open]

-- Others Solutions

-- =============================================================

-- openOrSenior :: [(Int, Int)] -> [Membership]
-- openOrSenior = map (\(a,b) -> if a >= 55 && b > 7 then Senior else Open)

-- =============================================================

-- openOrSenior :: [(Int, Int)] -> [Membership]
-- openOrSenior = map toMembership

-- toMembership :: (Int, Int) -> Membership
-- toMembership (age, handicap)
--   | age >= 55 && handicap > 7 = Senior
--   | otherwise = Open

-- =============================================================

-- openOrSenior :: [(Int, Int)] -> [Membership]
-- openOrSenior = map openOrSenior'
--   where openOrSenior' (age,handicap) = if age>=55 && handicap>7 then Senior else Open

-- =============================================================

-- testOpen :: (Int, Int) -> Membership
-- testOpen (a, h) = if a >= 55 && h > 7 then Senior else Open

-- openOrSenior :: [(Int, Int)] -> [Membership]
-- openOrSenior [] = []
-- openOrSenior xs = map testOpen xs

-- =============================================================

-- openOrSenior = map categorize
--   where categorize (age, handicap)
--           | 55 <= age && 7 < handicap = Senior
--           | otherwise                 = Open

-- =============================================================

-- openOrSenior xs = [ let (age, handicap) = x in
--   if (age >= 55 && handicap > 7) then Senior else Open | x <- xs]

-- =============================================================

-- openOrSenior ((x,y):xs) = (if x >= 55 && y > 7 then Senior else Open) : openOrSenior xs
