data Person' = Person' String String Int Float String String deriving (Show)

guy' = Person' "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

firstName' :: Person' -> String
firstName' (Person' firstname' _ _ _ _ _) = firstname'

lastName' :: Person' -> String
lastName' (Person' _ lastname' _ _ _ _) = lastname'

age' :: Person' -> Int
age' (Person' _ _ age' _ _ _) = age'

height' :: Person' -> Float
height' (Person' _ _ _ height' _ _) = height'

phoneNumber' :: Person' -> String
phoneNumber' (Person' _ _ _ _ number' _) = number'

flavor' :: Person' -> String
flavor' (Person' _ _ _ _ _ flavor') = flavor'

-- better way


data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

-- "By using record syntax to create this data type, Haskell automatically made these functions: firstName, lastName, age, height, phoneNumber and flavor."

guy = Person { firstName = "Buddy"
             , lastName = "Finklestein"
             , age = 43
             , height = 184.2
             , phoneNumber = "526-2928"
             , flavor = "Chocolate" }

-- same as
-- guy = Person' "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

-- ghci> :t firstName
-- firstName :: Person -> String
-- ghci> firstName guy
-- "Buddy"
-- ghci> flavor guy
-- "Chocolate"

data Car = Car { company :: String, model :: String, year :: Int } deriving (Show)

-- in record syntax the instatiation can be declared out of order
somecar = Car { year=1967, model="Mustang", company="Ford" }
