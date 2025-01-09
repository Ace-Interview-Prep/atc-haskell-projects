module GameLogic where

data Player = X | O deriving (Eq, Show)
type Board = [[Maybe Player]]
type Position = (Int, Int)

emptyBoard :: Board
emptyBoard = replicate 3 (replicate 3 Nothing)

makeMove :: Board -> Position -> Player -> Either String Board
makeMove board (row, col) player
  | row < 0 || row >= 3 || col < 0 || col >= 3 = Left "Move out of bounds. Try again."
  | board !! row !! col /= Nothing = Left "Cell already occupied. Try again."
  | otherwise = Right $ take row board
                ++ [take col (board !! row) ++ [Just player] ++ drop (col + 1) (board !! row)]
                ++ drop (row + 1) board

checkWin :: Board -> Player -> Bool
checkWin board player = any (all (== Just player)) (board ++ transpose board ++ diagonals board)

isDraw :: Board -> Bool
isDraw board = all (/= Nothing) (concat board)

nextPlayer :: Player -> Player
nextPlayer X = O
nextPlayer O = X

diagonals :: Board -> [[Maybe Player]]
diagonals board =
  [[board !! i !! i | i <- [0..2]], [board !! i !! (2 - i) | i <- [0..2]]]

transpose :: [[a]] -> [[a]]
transpose ([]:_) = []
transpose x = map head x : transpose (map tail x)
