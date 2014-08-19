-- ################################## Types and values ##################################

-- Using Strings and Concatenation
hello :: String -> String
hello foo = "Hello " ++ foo

-- Using Integer
hoursToMinutes :: Int -> Int
hoursToMinutes hours = 60 * hours

-- Using Float
celciusToFarenheit :: Float -> Float
celciusToFarenheit celcius = 32 + celcius * (9.0/5)

-- Multiline string
multi = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\
\Phasellus mattis ac tortor sed fringilla. Etiam aliquam\
\turpis sit amet nisi molestie, nec accumsan massa tempus.\n"

-- Boolean
value :: Bool
value = True
-- True && False -> False
-- True || False -> True
-- True == False -> True
-- True /= False -> True
-- not value -> False

-- Char
value2 :: Char
value2 = 'a'

-- ################################# Operating Variables ################################

-- Plus
plus :: Num a => a-> a-> a
plus a b = a + b

-- Minus
minus :: Num a => a-> a-> a
minus a b = a - b

-- Multiply
multiply :: Num a => a-> a-> a
multiply a b = a * b

-- Divide
divide :: Fractional a => a-> a-> a
divide a b = a / b

-- Module
op_mod :: Integral a => a-> a-> a
op_mod a b = mod a b
--op_mod a b = a `mod` b

-- Pow
pow :: Integral a => a -> a -> a
pow a b = a ^ b
-- pow a b = a ** b -> float point number

-- ################################## Strings operations #################################

replace a b []  = []
replace a b [c]
	| c == a 	= [b]
	| otherwise = [c]
replace a b (x:xs)
	| x == a 	= [b] ++ (replace a b xs)
	| otherwise = [x] ++ (replace a b xs)
-- replace ',' '.' "127,0,0,1" -> "127.0.0.1"

subString :: Int -> Int -> String -> String
subString _ _ "" = ""
subString _ _ [a] = [a]
subString 0 b c = aux_subString 0 b c
subString a b (_:xs)
	| a <= b = subString (a-1) (b-1) xs
	| otherwise = ""

aux_subString :: Int -> Int -> String -> String
aux_subString _ _ [] = ""
aux_subString a b (x:xs)
	| a < b = [x] ++ (aux_subString (a+1) b xs)
	| a == b = [x]
	| otherwise = ""
-- subString 0 1 "Lorem ipsum dolor sit amet"  -> "Lo"
-- subString 6 11 "Lorem ipsum dolor sit amet" -> "ipsum "
-- subString 0 5 "Lorem ipsum dolor sit amet"  -> "Lorem "
-- subString 6 -1 "Lorem ipsum dolor sit amet" -> ""

tillLast :: Int -> String -> String
tillLast _ [] = ""
tillLast 0 a = a
tillLast a (_:xs) = tillLast (a-1) xs
-- tillLast 6 "Lorem ipsum dolor sit amet" -> "ipsum dolor sit amet"

takeFrom :: Int -> Int -> String -> String
takeFrom _ 0 _ 	= ""
takeFrom _ _ "" = ""
takeFrom 0 a b 	= take a b
takeFrom a b (_:xs) = takeFrom (a-1) b xs
-- takeFrom 6 10 "Lorem ipsum dolor sit amet" -> "ipsum"