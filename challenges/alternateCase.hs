-- https://www.codewars.com/kata/57a62154cf1fa5b25200031e/solutions/haskell
-- Write function alternateCase which switch every letter in string from upper to lower and from lower to upper. E.g: "Hello World" -> "hELLO wORLD"

import Data.Char (isLower, isUpper, toUpper, toLower)
import Data.Bool (bool)

alternateCase :: String -> String
alternateCase = map mutate
  where mutate char
          | isLower char = toUpper char
          | otherwise = toLower char

alternateCase1 :: String -> String
alternateCase1 = map (\c -> if isLower c then toUpper c else toLower c)

alternateCase2 :: String -> String
alternateCase2 s = [ alt c
                    | c <- s,
                    let alt c = if isLower c then toUpper c else toLower c ]

-- =============================================================
-- Others Solutions
-- =============================================================

-- (>>=) :: forall a b. m a -> (a -> m b) -> m b
-- Sequentially compose two actions, passing any value produced by the first as an argument to the second.

-- (=<<) :: Monad m => (a -> m b) -> m a -> m b
-- Same as >>=, but with the arguments interchanged.

alternateCase4 :: String -> String
alternateCase4 = map (bool toLower toUpper =<< isLower)

-- =============================================================

alternateCase5 :: String -> String
alternateCase5 "" = ""
alternateCase5 (x:xs)
  | isUpper x = toLower x : alternateCase xs
  | otherwise = toUpper x : alternateCase xs
