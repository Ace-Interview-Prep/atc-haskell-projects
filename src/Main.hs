module Main where

import System.IO (hFlush, stdout)
import GameLogic
import Display
import Data.Char (isDigit)

main :: IO ()
main = do
  putStrLn "========================================"
  putStrLn " Welcome to Tic Tac Toe game! "
  putStrLn " Enjoy to the fullest!!!!! "
  putStrLn "========================================"
  loop

loop :: IO()
loop = do
  putStr "Enter the command (start, help, exit): "
  hFlush stdout
  input <- getLine
  isLooping <- handleInput input
  if isLooping
    then loop
    else return ()

handleInput :: String -> IO Bool
handleInput "exit" = do
  putStrLn "Goodbye see you next time!"
  pure False
handleInput "help" = do
  Display.displayHelp
  pure True
handleInput "start" = do
  gameLoop newGame
  pure True
handleInput _ = do
  putStrLn "Invalid command! Please enter 'start', 'help' or 'exit'."
  pure True
gameLoop :: Game -> IO ()
gameLoop game = do
  printBoard (board game)  -- Display the current board
  case state game of
    InProgress -> do
      putStrLn $ "Player " ++ show (currentPlayer game) ++ ", make your move (row and column): "
      hFlush stdout
      input <- getLine
      case parseMove input of
        Just (r, c) -> 
          case makeMove game (Move (currentPlayer game) (r, c)) of
            Left err -> putStrLn err >> gameLoop game
            Right newGameState -> gameLoop newGameState
        Nothing -> putStrLn "Invalid input! Enter a valid input(row and column between 1 to 3)." >> gameLoop game
    Draw -> putStrLn "It's a draw!" >> restartGame
    Won player -> do
      putStrLn $ "Player " ++ show player ++ " wins!"
      restartGame


-- Prompt for restarting the game
restartGame :: IO ()
restartGame = do
  putStrLn "Do you want to play again? (yes/no)"
  hFlush stdout
  response <- getLine
  if response == "yes"
    then gameLoop newGame
    else if response == "no"
      then putStrLn "Thanks for playing, always enjoy to play anytime!"
      else do
        putStrLn "Invalid choice. Please type 'yes' or 'no'."
        restartGame

-- Parse user input to extract a move (row and column)
parseMove :: String -> Maybe Position
parseMove input = case words input of
  [r, c] -> if all isDigit r && all isDigit c
            then Just (read r - 1, read c - 1)
            else Nothing
  _ -> Nothing