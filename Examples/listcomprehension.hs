filterodds xs = [x | x <- xs, odd x]
filterodds' xs = [x | x <- xs, x `mod` 2 /= 0]
-- filterodds' [1..10]
-- [1,3,5,7,9]

not15or17or20 xs = [x | x <- xs, x /= 15, x /= 17, x /= 20]
-- not15or17or20 [1..20]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,16,18,19]

boomBang xs = [if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]
-- boomBang [9..15]
-- ["BOOM!","BANG","BANG","BANG"]

multiplyBiggerThen10 xs ys = [ x * y | x <- xs, y <- ys, x * y > 10]
-- multiplyBiggerThen10 [1..5] [1..3]
-- [12,15]

firstNames = ["Rodolfo", "Carlos", "Vitor"]
lastNames = ["Olivera", "Tremonte", "Souza"]
fullNames fs ls = [f ++ " " ++ l | f <- fs, l <- ls ]
-- ["Rodolfo Olivera","Rodolfo Tremonte","Rodolfo Souza","Carlos Olivera","Carlos Tremonte","Carlos Souza","Vitor Olivera","Vitor Tremonte","Vitor Souza"]

length' xs = sum [1 | _ <- xs]
-- length' [1..10]
-- 10

list = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
removeOdds xxs = [ [ x | x <- xs, even x] | xs <- xxs]
-- removeOdds list
-- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
