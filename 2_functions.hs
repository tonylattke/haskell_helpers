-- #################################### Functions #######################################

-- ## Take value and make operation

-- Even or not
-- @number : Number to decide
-- @return : True if the number is even, otherwise False
op_even :: Integral a => a -> Bool
op_even number = mod number 2 == 0

-- ## Function with if .. then .. else ..

-- Factorial of number
-- @number : Number
-- @return : Factorial value of number
factorial 		:: Integral a => a -> a
factorial value =
	if value <= 1 
		then 1
	else 
		value * (factorial (value -1))

-- ## Function with if .. then .. else if .. then .. else ..

-- Fibonacci
-- @value : Number
-- @return : Fibonacci value
fibonacci 		:: Integral a => a -> a
fibonacci value =
	if value == 0 then 0
	else if value == 1 then 1
	else fibonacci (value-1) + fibonacci (value-2)

-- ## Otherwise

-- Fibonacci 2
fibonacci2 		:: Integral a => a -> a
fibonacci2 value
	| value == 0 = 0
	| value == 1 = 1
	| otherwise  = fibonacci2 (value-1) + fibonacci2 (value-2)

-- ## Pattern matching

map2          :: (a->b) -> [a] -> [b]
map2 f  []    =  []
map2 f (x:xs) =  f x : map2 f xs

-- ## Lambda

add :: Num a => a -> a -> a
add = \x y -> x+y

-- ## Error functions

head2 (x:xs) =  x
head2 []     =  error "head2{PreludeList}: head2 []"

-- ## Case

numsTill n = case n of
	0 -> [0]
	n -> n : numsTill (n-1)

-- ## compose .

nums = (reverse . numsTill)

-- ## Using Where

--  ax^2 + bx + c = 0:
numOfSolutions a b c
	| disc > 0  = 2
	| disc == 0 = 1
	| otherwise = 0
		where
			disc = b^2 - 4*a*c

-- ## Using Let and In

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
	let sideArea = 2 * pi * r * h;
		topArea = pi * r ^2
	in  sideArea + 2 * topArea