-- Complete the function that takes one argument, a list of words, and returns the length of the longest word in the list.

-- For example:

-- ["simple", "is" , "better", "than", "complex"] ==> 7
-- Do not modify the input list.

import Data.List(sortBy)
import Data.Function(on)

test = ["simple", "is" , "better", "than", "complex"]

longest :: [String] -> Int
longest words = length $ head $ reverse $ sortBy (\x y -> length x `compare` length y) words

-- Point Free
longest' :: [String] -> Int
longest' = length . head . reverse . sortBy (\x y -> length x `compare` length y)

-- On operator
longest'' :: [String] -> Int
longest'' = length . head . reverse . sortBy (compare `on` length)

-------------------------------------------------------------
-- Others Soluctions
-------------------------------------------------------------

longest1 :: [String] -> Int
longest1 = maximum . map length

longest2 :: [String] -> Int
-- An infix synonym for fmap.
-- The name of this operator is an allusion to $. Note the similarities between their types:
-- ($)   ::              (a -> b) ->   a ->   b
-- (<$>) :: Functor f => (a -> b) -> f a -> f b
longest2 = (<$>) maximum $ (<$>) length
