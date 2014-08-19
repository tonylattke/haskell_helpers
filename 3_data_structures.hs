import Data.List
import qualified Data.Map as Map
import qualified Data.Sequence as Seq

-- #################################### Tuples ##########################################

mytuple   = ("Bruce","Wayne")

mytriplet = ("Red", "Green", "Blue")

ntuple 	  = ("Batman", "Superman", "Wonder Woman", "Green Light", "Flash", "J\'onn")

-- fst mytuple
-- snd mytuple

-- ##################################### Lists ##########################################

-- Empty list
empty_list = []
-- let empty_list = []

-- Append elements to the list
append = 4 : [8,15,16,23,42]

-- Concatenation
concatenation = [1] ++ [2..10]

-- Length
size = length []

-- List of lists
listOfLists = [[1,2,3,4], [5,6,7,8], [9,10,11,12]]

-- Sort
someFibNumbers = sort [5, 13, 2, 1 , 21, 1, 8, 3]

-- Reverse
listReversed = reverse [4, 8, 15, 16, 23, 42]

-- Access !!
access = [4, 8, 15, 16, 23, 42] !! 5

-- head
firstElement = head [4, 8, 15, 16, 23, 42]

-- tail
tailList = tail [4, 8, 15, 16, 23, 42]

-- Is empty (null)
isEmpty = null [4, 8, 15, 16, 23, 42]

-- Compresion list

combinations = [(i,j) | i <- [1,2], j <- [1..4]]

squares = [ (i,i^2) | i <- [1..10], i < 10 ]

primeNumbers = take 10 [ (i,j) | i <- [1..], j <- [1..i-1], gcd i j == 1 ]

-- ###################################### Map ###########################################

-- Empty
mapAges = Map.empty

-- Append elements
mapAges1 = Map.insert "a" "Alice" mapAges
mapAges2 = Map.insert "e" "Erick" . Map.insert "i" "Isaac" . Map.insert "o" "Oscar" . Map.insert "u" "Ursula" $ mapAges1

-- show mapAges2

-- Access
valueI = mapAges2 Map.! "i"

-- Change values
f x = "Oriana"
mapAges3 = Map.adjust f "o" mapAges2
-- mapAges3 = Map.adjust (\x -> "Oriana") "o" mapAges2

-- Keys
mapKeys = Map.keys mapAges2

-- Values
mapValues = Map.elems mapAges2

-- Map loaded
months = Map.fromList [
		("January" 	, "Capricorn"),
		("February" , "Aquarius"),
		("March"	, "Pisces"),
		("April"	, "Aries"),
		("May"		, "Taurus"),
		("June"		, "Gemini"),
		("July"		, "Cancer"),
		("August"	, "Leo"),
		("September", "Virgo"),
		("October"	, "Libra"),
		("November"	, "Scorpio"),
		("December"	, "Sagittarius")
		]

-- Map.size months

-- Delete by key
months2 = Map.delete "December" months

-- Single element
singleton = Map.singleton 1 'a'

-- Map.toList map

-- Is in
valueR = Map.member "August" months

-- ###################################### Seq ###########################################

-- Empty seq
empty_seq = Seq.empty

-- Append on the left
append_seq = 4 Seq.<| (Seq.fromList [8,15,16,23,42])

-- Append on the right
append_seq2 = (Seq.fromList [4,8,15,16,23]) Seq.|> 42

-- Concat Sequence
twoSeq = append_seq Seq.>< append_seq2

-- Length
size_seq = Seq.length empty_seq

-- Is empty (null)
isEmpty_seq = Seq.null empty_seq

-- Access !!
access_seq = Seq.index append_seq 5

-- Other functions are available: sort, head, tail, reverse