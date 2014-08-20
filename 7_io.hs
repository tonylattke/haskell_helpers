import System.IO

main = do
	putStrLn "Introduce the file name: "

	-- Get the standard input
	file_name <- getLine
	
	-- ################################## Write on file #################################

	-- Create and open the file
	file_1 <- openFile file_name WriteMode
	
	-- Write on file
	hPutStrLn file_1 "test on file"
	hPutStr file_1 (unlines ["second text", "third text", "fourth line"])

	-- Close the file
	hClose file_1

	-- ################################### Read a file ##################################

	-- Open the file
	file_2 <- openFile file_name ReadMode

	-- Get the content
	aux <- hGetContents file_2
	putStrLn "The content of the file is: "
	putStrLn aux

	-- Close the file
	hClose file_2

-- Other Examples

read_mode_2 :: FilePath -> IO String
read_mode_2 l = do
	r <- openFile l ReadMode
	t <- hGetContents r	
	return t
-- read_mode_2 "0_hello_world.hs"

write_mode_2 :: String -> FilePath -> IO ()
write_mode_2 info name = writeFile name info

-- write_mode_2 "Test \n Works!" "file2.txt"