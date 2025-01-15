module Main where

import System.IO (hFlush, stdout)
import GameLogic
import Display

main :: IO ()
main = do
  putStrLn "Welcome to Tic Tac Toe!"
  displayHelp --Show the help menu
  gameLoop emptyBoard X

gameLoop :: Board -> Player -> IO ()
gameLoop board currentPlayer = do
  putStrLn "\nCurrent Board:"
  printBoard board
  if checkWin board X
    then putStrLn "Player X wins!" >> restartGame
    else if checkWin board O
      then putStrLn "Player O wins!" >> restartGame
      else if isDraw board
        then putStrLn "It's a draw!" >> restartGame
        else do
          putStrLn $ "Player " ++ show currentPlayer ++ ", enter your move (row and column): "
          hFlush stdout
          input <- getLine
          case parseMove input of
            Just pos ->
              case makeMove board pos currentPlayer of
                Left err -> putStrLn err >> gameLoop board currentPlayer
                Right newBoard -> gameLoop newBoard (nextPlayer currentPlayer)
            Nothing -> putStrLn "Invalid input. Enter row and column as two numbers (e.g., 1 2)." >> gameLoop board currentPlayer

restartGame :: IO ()
restartGame = do
  putStrLn "Do you want to play again? (yes/no)"
  hFlush stdout
  response <- getLine
  if response == "yes" 
    then gameLoop emptyBoard X  -- Restart the game
    else if response == "no"
      then putStrLn "Thanks for playing!"
      else do
        putStrLn "Invalid choice. Please type 'yes' or 'no'."
        restartGame  -- Prompt again if the input is invalid

parseMove :: String -> Maybe Position
parseMove input =
  case words input of
    [r, c] -> case (readMaybe r, readMaybe c) of
                (Just row, Just col) -> Just (row - 1, col - 1)
                _ -> Nothing
    _ -> Nothing

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
  [(val, "")] -> Just val
  _ -> Nothing
