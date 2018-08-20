-- Exporting modules
module Shapes
( Point(..)
, Shape(Circle, Rectangle)
-- , Shape => Not exporting the value constructors of a data types makes them more abstract in such a way that we hide their implementation
, surface
, moveShape
, baseCircle
, baseRect
) where

-- Base Syntax
-- data TypeConstructor = ValueConstructor

-- "value constructors are just functions that take the fields as parameters and return a value of some type (like Shape) as a result"

-- 1 value constructor
data Point = Point Float Float deriving (Show)

-- 2 values constructor
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

a = Circle (Point 10 1) 50
b = Rectangle (Point 15 12 ) (Point 50 15)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

moveShape :: Shape -> Float -> Float -> Shape
moveShape (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
moveShape (Rectangle (Point x1 y1) (Point x2 y2)) a b =
  Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)
