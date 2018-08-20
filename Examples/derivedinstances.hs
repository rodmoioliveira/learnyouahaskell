-- ========================================================================
-- Equate typeclasse
-- ========================================================================

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq)

-- When we derive the Eq instance for a type and then try to compare two values of that type with == or /=, Haskell will see if the value constructors match (there's only one value constructor here though) and then it will check if all the data contained inside matches by testing each pair of fields with ==. There's only one catch though, the types of all the fields also have to be part of the Eq typeclass. But since both String and Int are, we're OK. Let's test our Eq instance

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}

-- ghci> mca == adRock
-- False
-- ghci> mikeD == adRock
-- False
-- ghci> mikeD == mikeD
-- True
-- ghci> mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}
-- True

-- Of course, since Person is now in Eq, we can use it as the a for all functions that have a class constraint of Eq a in their type signature, such as elem.

beastieBoys = [mca, adRock, mikeD]

-- ghci> mikeD `elem` beastieBoys
-- True

-- ========================================================================
-- Show and Read typeclasses
-- ========================================================================

-- The Show and Read typeclasses are for things that can be converted to or from strings, respectively. Like with Eq, if a type's constructors have fields, their type has to be a part of Show or Read if we want to make our type an instance of them. Let's make our Person data type a part of Show and Read as well.

-- derived for equate, show and read (now thow persons can be compare
data Person'' = Person'' { firstName'' :: String
                         , lastName'' :: String
                         , age'' :: Int
                         } deriving (Eq, Show, Read)

mikeD'' = Person'' {firstName'' = "Michael", lastName'' = "Diamond", age'' = 43}
adRock'' = Person'' {firstName'' = "Adam", lastName'' = "Horovitz", age'' = 41}
mca'' = Person'' {firstName'' = "Adam", lastName'' = "Yauch", age'' = 44}

-- Show
-- ghci> mikeD''
-- Person'' {firstName'' = "Michael", lastName'' = "Diamond", age'' = 4

-- Read
-- ghci> read "Person'' {firstName'' =\"Michael\", lastName'' =\"Diamond\", age'' = 43}" :: Person''
-- Person'' {firstName'' = "Michael", lastName'' = "Diamond", age'' = 43}

-- ========================================================================
-- Ord typeclasse
-- ========================================================================

-- We can derive instances for the Ord type class, which is for types that have values that can be ordered. If we compare two values of the same type that were made using different constructors, the value which was made with a constructor that's defined first is considered smaller. For instance, consider the Bool type, which can have a value of either False or True. For the purpose of seeing how it behaves when compared, we can think of it as being implemented like this:

-- data Bool = False | True deriving (Ord)

-- Because the False value constructor is specified first and the True value constructor is specified after it, we can consider True as greater than False.

-- ghci> True `compare` False
-- GT
-- ghci> True > False
-- True
-- ghci> True < False
-- False

-- ========================================================================
-- Enum and Bounded typeclasses
-- =========================================================================

-- Because all the value constructors are nullary (take no parameters, i.e. fields), we can make it part of the Enum typeclass. The Enum typeclass is for things that have predecessors and successors. We can also make it part of the Bounded typeclass, which is for things that have a lowest possible value and highest possible value. And while we're at it, let's also make it an instance of all the other derivable typeclasses and see what we can do with it.

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- Because it's part of the Show and Read typeclasses, we can convert values of this type to and from strings.
-- ghci> Wednesday
-- Wednesday
-- ghci> show Wednesday
-- "Wednesday"
-- ghci> read "Saturday" :: Day
-- Saturday

-- Because it's part of the Eq and Ord typeclasses, we can compare or equate days.
-- ghci> Saturday == Sunday
-- False
-- ghci> Saturday == Saturday
-- True
-- ghci> Saturday > Friday
-- True
-- ghci> Monday `compare` Wednesday
-- LT

-- It's also part of Bounded, so we can get the lowest and highest day.
-- ghci> minBound :: Day
-- Monday
-- ghci> maxBound :: Day
-- Sunday

-- It's also an instance of Enum. We can get predecessors and successors of days and we can make list ranges from them!
-- ghci> succ Monday
-- Tuesday
-- ghci> pred Saturday
-- Friday
-- ghci> [Thursday .. Sunday]
-- [Thursday,Friday,Saturday,Sunday]
-- ghci> [minBound .. maxBound] :: [Day]
-- [Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
-- That's pretty awesome.
