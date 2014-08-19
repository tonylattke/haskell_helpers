module ModuleTest (Color, Color2, Person(), hello, Habilitie(..)) where
-- Note: Tree are MCYK not exported on this module.

-- For use this module use: import ModuleTest
	
-- ######################################## Type ########################################

	-- Type - Is used for create synonims
	type Color = (Integer, Integer, Integer)

-- ###################################### New Type ######################################

	-- New type - Need a constructor
	newtype Color2 = Color2Mk (Integer, Integer, Integer)
		
	instance Show Color2 where
		show (Color2Mk (r,g,b)) = "R: " ++ (show r) ++ 
			" G: " ++ (show g) ++ 
			" B: " ++ (show b)

-- ######################################## Data ########################################

-- Person

	data Person = PersonMk (String, Integer)

	instance Show Person where
		show (PersonMk (name,age)) = "Name: " ++ name ++ " Age: " ++ (show age)

	-- PersonMk ("Bruce", 28)

	hello :: Person -> String
	hello (PersonMk (name,age)) = "Hello " ++ name
	-- hello $ PersonMk ("Bruce", 28)
	-- hello  (PersonMk ("Bruce", 28))

-- Character habilitie

	data Habilitie 	= Strike String Integer					-- Strike name points
					| Fire String Integer Integer			-- Fire name points distance
					| Water String Integer Float			-- Water name points area
					| Earth String Integer Integer Integer	-- Earth name points distance weight
					| Air String Integer Integer Float		-- Air name points distance area

	data Tree a	= Leaf a
				| Branch (Tree a) (Tree a)
		deriving (Eq, Ord, Show)

	height :: Tree a -> Integer
	height (Leaf _) = 0
	height (Branch left right) = 1 + (max (height left) (height right))

	-- height (Branch (Leaf 1) (Branch (Leaf 1) (Leaf 2))) -> 2

-- ####################################### Class ########################################

	data MCY = Magenta | Cyan | Yellow

	class BasicEq a where
		isEqual :: a -> a -> Bool

	instance BasicEq MCY where
		-- isEqual :: (BasicEq MCY) => MCY -> MCY -> Bool
		isEqual Magenta Magenta = True
		isEqual Yellow Yellow = True
		isEqual Cyan Cyan = True
		isEqual _ _ = False