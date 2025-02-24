module Display (printBoard, displayHelp) where

import GameLogic (Board, Player(..))

printBoard :: Board -> IO ()
printBoard board = putStrLn $ unlines $ map (unwords . map cellToChar) board
  where
    cellToChar Nothing = "."
    cellToChar (Just X) = "X"
    cellToChar (Just O) = "O"

displayHelp :: IO ()
displayHelp = do
  putStrLn "Here are the instructions to play the game:"
  putStrLn ""
  putStrLn "1. How to start the game:"
  putStrLn "   - Select start"
  putStrLn "2. How to make a move:"
  putStrLn "   - The board is represented as a 3x3 grid with numbered positions:"
  putStrLn "       1 | 2 | 3"
  putStrLn "      ---+---+---"
  putStrLn "       4 | 5 | 6"
  putStrLn "      ---+---+---"
  putStrLn "       7 | 8 | 9"
  putStrLn "   - Enter the number corresponding to the position where you want to place your mark (X or O)."
  putStrLn "   - For instance when Player X provides 1 1 the first cell will be occupied as follows:"
  putStrLn "       X |   |   "
  putStrLn "      ---+---+---"
  putStrLn "         |   |   "
  putStrLn "      ---+---+---"
  putStrLn "         |   |   "
  putStrLn ""
  putStrLn "Enjoy the game! May the best player win!"
