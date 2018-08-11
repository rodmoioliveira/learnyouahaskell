-- Where Bindings
-- Visible for all guards
age' :: (Num a, Ord a) => a -> [Char]
age' x
  | x <= child = "Muito jovem!"
  | x <= young = "Adolescente!"
  | x <= adult = "Jovem adulto"
  | x <= old = "Meia Idade"
  | otherwise = "Velho"
  where child = 15
        young = 18
        adult = 30
        old = 50

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

multiply' :: Num t => [(t, t)] -> [t]
multiply' xs = [ mult x y | (x,y) <- xs]
  where mult x y = x * y

describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."

-- let <bindings> in <expression>
-- Very Local, don't cross guards
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
  in sideArea + 2 * topArea

squares = [let square x = x * x in (square 5, square 3, square 2)]
-- [(25,9,4)]

tuple = (
  let a = 100; b = 200; c = 300 in a*b*c,
  let foo="Hey "; bar = "there!" in foo ++ bar
  )
-- (6000000,"Hey there!")

doubles :: (Num t, Ord t) => [t] -> [t]
doubles xs = [double | x <- xs, let double = x * 2, double < 15]
