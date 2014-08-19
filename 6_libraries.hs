import Data.Time
import System.Random
import Data.Array.IO
import Control.Monad

-- ###################################### Datetime ######################################

-- Now

today = do 
	myTime <- getCurrentTime
	let (year, _, _) = toGregorian $ utctDay myTime 
	putStrLn $ "It's currently: " ++ show myTime
	putStrLn $ "This year is " ++ show year


-- Now - 2 Hours
two_hours = do
	myTime <- getCurrentTime
	let twoHours = 2 * 60 * 60
	let new_time = (-twoHours) `addUTCTime` myTime
	putStrLn $ "Two hours substact " ++ show new_time

day = UTCTime (fromGregorian 1990 2 14) (timeOfDayToTime $ TimeOfDay 4 30 05) -- 1990-02-14 04:30:05 UTC

-- Difference between days
-- realToFrac (diffUTCTime day day)

-- #################################### Math ############################################

-- Elemental numbers

num_pi	= pi

num_e	= exp 1

phi		= (1 + sqrt(5))/2

x = 10

-- Operations
isnan 	= isNaN x		-- Is not a number

trunct 	= truncate x	-- Truncate x

roun 	= round x		-- Round x

logRes	= log x			-- Default base e (logBase base x))

sqrt_op = sqrt x

result_1 = sin x
result_2 = cos x
result_3 = tan x

-- ######################################## Random ######################################

choiceRandom :: [a] -> IO a
choiceRandom l = randomRIO (0, length l - 1) >>= return . (l !!)

randomRange :: Random a => a -> a -> IO a
randomRange x y = randomRIO (x, y) >>= return

-- Source: http://www.haskell.org/haskellwiki/Random_shuffle
shuffle :: [a] -> IO [a]
shuffle xs = do
        ar <- newArray n xs
        forM [1..n] $ \i -> do
            j <- randomRIO (i,n)
            vi <- readArray ar i
            vj <- readArray ar j
            writeArray ar j vi
            return vj
  where
    n = length xs
    newArray :: Int -> [a] -> IO (IOArray Int a)
    newArray n xs =  newListArray (1,n) xs

randomOperations :: IO ()
randomOperations = do
	-- Random number betwen 0 and 1
	num <- randomIO :: IO Float	
	putStrLn $ "Betwen 0 and 1: " ++ (show num)

	let mylist = [4, 8, 15, 16, 23, 42]
	-- Random sort of list
	randomList <- shuffle mylist
	putStrLn $ "Random member: " ++ (show randomList)

	-- Random member of list
	randomMember <- choiceRandom mylist
	putStrLn $ "Random member: " ++ (show randomMember)

	-- Random int on range
	-- To do

	putStrLn "End of Program"