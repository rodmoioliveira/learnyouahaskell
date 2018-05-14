-- A pangram is a sentence that contains every single letter of the alphabet at least once.
-- For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram,
-- because it uses the letters A-Z at least once (case is irrelevant).

-- Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

-- https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/haskell

import Data.Char(isSpace, toLower)
import Data.List

alphabet = ['a'..'z']
removeSpaces string = map toLower $ filter (not . isSpace) string

isPangram :: String -> Bool
isPangram str = (length $ alphabet \\ (removeSpaces . nub $ str)) == 0

-- Others Solutions

-- =============================================================

-- import Data.Char

-- isPangram :: String -> Bool
-- isPangram str = and (map (`elem` str) ['a'..'z'])
