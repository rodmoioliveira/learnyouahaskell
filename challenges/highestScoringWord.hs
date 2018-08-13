-- Given a string of words, you need to find the highest scoring word.

-- Each letter of a word scores points according to it's position in the alphabet: a = 1, b = 2, c = 3 etc.

-- You need to return the highest scoring word as a string.

-- If two words score the same, return the word that appears earliest in the original string.

-- All letters will be lowercase and all inputs will be valid

-- "man i need a taxi up to ubud" `shouldBe` "taxi"

import Data.Ord
import Data.Char
import Data.List
import Data.Maybe

high :: String -> String
high "" = ""
high string = getMaximum pairValues
      where pontuation = zip [1..] ['a'..'z']
            lowerSring = map toLower string
            findValue char = (find (\(v,c) -> c == char) pontuation)
            getValue word = map (fst . fromJust . findValue) word
            wordsValue = map sum (map getValue wordsCollection)
            wordsCollection = words lowerSring
            pairValues = zip wordsValue wordsCollection
            getMaximum xs = snd $ foldr1 (\t1@(v1,w1) t2@(v2,w2) -> if v2 > v1 then t2 else t1) xs

-- =============================================================
-- Others Solutions
-- =============================================================

-- a :: Int
-- a = ord 'a'

-- high :: String -> String
-- high [] = []
-- high s  = maximumBy (comparing (sum . map (subtract a . ord))) . words $ s
