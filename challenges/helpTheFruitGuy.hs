-- Our fruit guy has a bag of fruit (represented as an array of strings) where some fruits are rotten. He wants to replace all the rotten pieces of fruit with fresh ones. For example, given ["apple","rottenBanana","apple"] the replaced array should be ["apple","banana","apple"]. Your task is to implement a method that accepts an array of strings containing fruits should returns an array of strings where all the rotten fruits are replaced by good ones.

-- Notes
-- If the array is null/nil/None or empty you should return empty array ([]).
-- The rotten fruit name will be in this camelcase (rottenFruit).
-- The returned array should be in lowercase.

import Data.List
import Data.Char
import Data.Maybe

test = ["banana", "rottenApple", "tomato"]

removeRotten :: [String] -> [String]
removeRotten = map replaceFruits
  where isRotten = (isPrefixOf "rotten")
        separate = (\\ "rotten")
        removeRotten = map toLower . separate
        replaceFruits x
          | isRotten x = removeRotten x
          | otherwise = x

-------------------------------------------------------------
-- Others Soluctions
-------------------------------------------------------------

-- http://hackage.haskell.org/package/base-4.11.1.0/docs/Data-Maybe.html#t:Maybe
-- The maybe function takes a default value, a function, and a Maybe value. If the Maybe value is Nothing, the function returns the default value. Otherwise, it applies the function to the value inside the Just and returns the result.
-- maybe :: b -> (a -> b) -> Maybe a -> b
removeRotten' :: [String] -> [String]
removeRotten' = map (
  \fruit -> maybe fruit (map toLower) $ stripPrefix "rotten" fruit
  )

-------------------------------------------------------------

-- The fromMaybe function takes a default value and and Maybe value. If the Maybe is Nothing, it returns the default values; otherwise, it returns the value contained in the Maybe.
-- fromMaybe :: a -> Maybe a -> a
removeRotten'' :: [String] -> [String]
removeRotten'' = map (\s -> fromMaybe s $ stripPrefix "rotten" $ map toLower s)

-------------------------------------------------------------

-- Insane pattern matching
removeRotten''' :: [String] -> [String]
removeRotten''' = map replace
replace :: String -> String
replace ('r':'o':'t':'t':'e':'n':f:ruit) = (toLower f):ruit
replace fruit = fruit

-------------------------------------------------------------

removeRotten1 :: [String] -> [String]
removeRotten1 [] = []
removeRotten1 xs = [removeRotten2 s | s <- xs]

removeRotten2 :: String -> String
removeRotten2 s
  | "rotten" `isPrefixOf` s = map toLower (s \\ "rotten")
  | otherwise = s
