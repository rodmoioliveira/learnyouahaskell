-- The word i18n is a common abbreviation of internationalization in the developer community, used instead of typing the whole word and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.

-- Write a function that takes a string and turns any and all "words" (see below) within that string of length 4 or greater into an abbreviation, following these rules:

-- A "word" is a sequence of alphabetical characters. By this definition, any other character like a space or hyphen (eg. "elephant-ride") will split up a series of letters into two words (eg. "elephant" and "ride").
-- The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (eg. "elephant ride" => "e6t r2e").
-- Example
-- abbreviate("elephant-rides are really fun!")
-- //          ^^^^^^^^*^^^^^*^^^*^^^^^^*^^^*
-- // words (^):   "elephant" "rides" "are" "really" "fun"
-- //                123456     123     1     1234     1
-- // ignore short words:               X              X

-- // abbreviate:    "e6t"     "r3s"  "are"  "r4y"   "fun"
-- // all non-word characters (*) remain in place
-- //                     "-"      " "    " "     " "     "!"
-- === "e6t-r3s are r4y fun!"

import Data.Char
import Data.List.Split
import Data.List
import Data.Function

test = "elephant-rides are really fun!"
test2 = "internationalization, asdasd, asd!"
test3 = ""

abbreviate :: String -> String
abbreviate str = foldl (++) [] $ join (transform $ filter (not . null) (onlyWords str)) (pontuaction)
  where pontuaction = wordsBy isLetter $ str
        onlyWords = splitOneOf (unwords pontuaction)
        transform = map (\word -> if length word < 4 then word else abr word)
        abr x = [head x] ++ show ((length x) - 2) ++ [last x]
        join [] [] = []
        join all@(x:xs) [] = x : join xs []
        join (x:xs) (y:ys) = x : y : join xs ys

-- FAIL!
-- https://www.codewars.com/kata/word-a10n-abbreviation/solutions?show-solutions=1

-- =============================================================
-- Others Soluctions
-- =============================================================


abbreviate'' :: String -> String
abbreviate'' = concat . map shorten . groupBy ((==) `on` isAlpha)
                           -- same as groupBy (\a b -> isAlpha a && isAlpha b)
  where shorten str
          | length str < 4 = str
          | otherwise = [head str] ++ show (length str - 2) ++ [last str]

-- =============================================================

abbreviate' :: String -> String
abbreviate' = mapWords ab
  where ab s | length s < 4 = s
              | otherwise = head s : show (length s - 2) ++ [last s]

mapWords :: (String -> String) -> String -> String
mapWords _ "" = ""
mapWords f s = (f alphas) ++ notAlphas ++ mapWords f y
  where (alphas, x) = span isAlpha s
        (notAlphas, y) = break isAlpha x
