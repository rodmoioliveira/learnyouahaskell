-- data Maybe a = Nothing | Just a

-- The a here is the type parameter. And because there's a type parameter involved, we call Maybe a type constructor. Depending on what we want this data type to hold when it's not Nothing, this type constructor can end up producing a type of Maybe Int, Maybe Car, Maybe String, etc. No value can have a type of just Maybe, because that's not a type per se, it's a type constructor. In order for this to be a real type that a value can be part of, it has to have all its type parameters filled up.

-- ghci> Just "Haha"
-- Just "Haha"
-- ghci> Just 84
-- Just 84
-- ghci> :t Just "Haha"
-- Just "Haha" :: Maybe [Char]
-- ghci> :t Just 84
-- Just 84 :: (Num t) => Maybe t
-- ghci> :t Nothing
-- Nothing :: Maybe a
-- ghci> Just 10 :: Maybe Double
-- Just 10.0

-- Using type parameters is very beneficial, but only when using them makes sense. Usually we use them when our data type would work regardless of the type of the value it then holds inside it, like with our Maybe a type.

-- Let's implement a 3D vector type and add some operations for it. We'll be using a parameterized type because even though it will usually contain numeric types, it will still support several of them.

-- data TypeConstructor typeParameter = ValueConstructor typeParameters
data Vector a = Vector a a a deriving (Show)

a = Vector 10 25 85
b = Vector 658 15 55

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n

-- Also, if you examine the type declaration for these functions, you'll see that they can operate only on vectors of the same type and the numbers involved must also be of the type that is contained in the vectors. Notice that we didn't put a Num class constraint in the data declaration, because we'd have to repeat it in the functions anyway.

-- Once again, it's very important to distinguish between the type constructor and the value constructor. When declaring a data type, the part before the = is the type constructor and the constructors after it (possibly separated by |'s) are value constructors. Giving a function a type of Vector t t t -> Vector t t t -> t would be wrong, because we have to put types in type declaration and the vector type constructor takes only one parameter, whereas the value constructor takes three.

-- ghci> :t Vector 4 9 5 `scalarMult` Vector 9.0 2.0 4.0
-- Vector 4 9 5 `scalarMult` Vector 9.0 2.0 4.0 :: {{{Fractional}}} t => t
-- ghci> :t Vector 4 9 5 `scalarMult` Vector 9 2 4
-- Vector 4 9 5 `scalarMult` Vector 9 2 4 :: {{{Num}}} t => t
