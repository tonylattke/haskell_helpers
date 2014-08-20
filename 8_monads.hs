import Control.Monad.Writer
import Control.Monad.State
import Control.Monad.Reader
import Control.Monad.RWS.Lazy
-- Exist too import Control.Monad.RWS.Strict and Class

import Data.Maybe
import qualified Data.Map as Map

-- ##################################### Maybe ##########################################

testMaybe :: Int -> Maybe Int
testMaybe x
	| x >= 0 	= Just x
	| otherwise = Nothing

-- ##################################### Writer #########################################

register :: Int -> Writer [String] Int
register x = writer (x , ["Register: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
	a <- register 21
	b <- register 2
	tell ["Multiply values."]
	return $ a * b

-- Run Example: runWriter multWithLog
-- Result will be: (42,["Register: 21","Register: 2","Multiply values."])
-- Result format: (result, log_list)

-- Note: Others functions are available (censor, listen)

-- ###################################### State #########################################

-- ## Example 1 - Strings

greeter :: State String String
greeter = do
    name <- get
    put "Bruce"
    return ("Hello, " ++ name ++ "!")

-- runState greeter "Tony"
-- Result will be: ("Hello, Tony!","Bruce")
-- Result format: (message , current_state)

-- ## Example 2 - Generic Stack

type Stack a = [ a ]

pop :: State ( Stack a ) a
pop = state (\(x:xs) -> (x , xs))

push :: a -> State ( Stack a ) ()
push a = state (\ xs -> (() , a:xs))

-- Run Example: runState ( push 3 >> push 2 >> pop >> push 1) []
-- Result format: (last_value, stack_status)
-- Result will be: ((),[1,3])

stackExample :: State (Stack Int) Int  
stackExample = do  
	push 3
	push 2
	a <- pop
	push 1
	pop
	-- return a

-- Run Example: runState stackExample []
-- Result format: (last_value, stack_status)
-- Result will be: (1,[3])

-- Note: Others functions are available (modify)

-- ###################################### Reader #########################################

-- Source: https://hackage.haskell.org/package/mtl-1.1.0.2/docs/Control-Monad-Reader.html

-- ## Example 1

type Bindings = Map.Map String Int;

-- Returns True if the "count" variable contains correct bindings size.
isCountCorrect :: Bindings -> Bool
isCountCorrect bindings = runReader calc_isCountCorrect bindings

-- The Reader monad, which implements this complicated check.
calc_isCountCorrect :: Reader Bindings Bool
calc_isCountCorrect = do
	count <- asks (lookupVar "count")
	bindings <- ask
	return (count == (Map.size bindings))

-- The selector function to  use with 'asks'.
-- Returns value of the variable with specified name.
lookupVar :: String -> Bindings -> Int
lookupVar name bindings = fromJust (Map.lookup name bindings)

sampleBindings = Map.fromList [("count",3), ("1",1), ("b",2)]

example_reader = do
	putStr $ "Count is correct for bindings " ++ (show sampleBindings) ++ ": ";
	putStrLn $ show (isCountCorrect sampleBindings);

-- Run Example: example_reader

-- ## Example 2 - Using Local

calculateContentLen :: Reader String Int
calculateContentLen = do
	content <- ask
	return (length content);

-- Calls calculateContentLen after adding a prefix to the Reader content.
calculateModifiedContentLen :: Reader String Int
calculateModifiedContentLen = local ("Prefix " ++) calculateContentLen

example_reader_2 = do
	let s = "12345";
	let modifiedLen = runReader calculateModifiedContentLen s
	let len = runReader calculateContentLen s
	putStrLn $ "Modified 's' length: " ++ (show modifiedLen)
	putStrLn $ "Original 's' length: " ++ (show len)

-- Run Example: example_reader_2

-- ###################################### RWS ###########################################

type Contrived a = RWS Int [Int] Int a

contrived :: Contrived ()
contrived = do
	env <- ask         -- read from the fixed environment
	s0  <- get         -- grab the current state
	let s1 = s0 + env  -- increment the current state by the environment value
	put s1             -- update the state to the new, incremented value
	tell [s1]          -- log the new value

-- Run Example: runRWS contrived 1 1
-- Result will be: ((),2,[2])
-- Result format: (last_value, reader_value, writer_log)