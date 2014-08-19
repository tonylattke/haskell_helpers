import Debug.Trace

numbers = [1..10]
-- ##################################### Map ############################################

squares = map (^2) numbers

-- #################################### Filter ##########################################

evenNumbers = filter (\x -> even x) numbers

-- ##################################### Fold ###########################################

-- foldl 
sumAll = foldl (+) 0 numbers

-- foldr
sumAll2 = foldr (+) 0 numbers

-- ##################################### Zip ############################################

-- zip
numberWithSquare = zip numbers squares

-- unzip
number2List = unzip numberWithSquare

-- ##################################### Scan ###########################################

-- scanl
sumAllS = scanl (+) 0 numbers

-- scanr
sumAllS2 = scanr (+) 0 numbers

-- scanl without a starting value
sumAllS3 = scanl1 (+) numbers

-- scanr without a starting value
sumAllS4 = scanr1 (+) numbers

-- ##################################### Trace ##########################################

-- trace :: String -> a -> a

fibonacci :: Int -> Int
fibonacci 0 = trace "branch: 0" 0
fibonacci 1 = trace "branch: 1" 1
fibonacci n = trace ("branch: " ++ show n) $ fibonacci (n - 1) + fibonacci (n - 2)

-- ################################ Operator position ###################################

-- Prefix
suma x y = x + y

-- Unfix
usingSuma = 23 `suma` 19

-- ##################################### Maybe ##########################################

positive :: (Num a, Ord a) => a -> Maybe a
positive x
	| x >= 0    = Just x
	| otherwise = Nothing

-- ############################### Strict evaluation ####################################

-- To do (read about $!)

-- Note: All of these functions are available for Sequence and others structures too
-- For example Sequence.foldlWithIndex (\x i y -> y+x) 0 (Sequence.fromList([1..2]))