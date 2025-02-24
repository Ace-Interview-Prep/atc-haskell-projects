module GameLogic where

data Player = X | O deriving (Eq, Show)
type Position = (Int, Int)
type Board = [[Maybe Player]]

data GameState = InProgress | Draw | Won Player deriving (Show)
data Move = Move Player Position deriving (Show)

data Game = Game {
    board :: Board,        
    currentPlayer :: Player,
    state :: GameState        
} deriving (Show)

emptyBoard :: Board
emptyBoard = replicate 3 (replicate 3 Nothing)

newGame :: Game
newGame = Game { board = emptyBoard, currentPlayer = X, state = InProgress }

makeMove :: Game -> Move -> Either String Game
makeMove game (Move player (row, col))
    | row < 0 || row >= 3 || col < 0 || col >= 3 = Left "Move out of bounds. Try again."
    | board game !! row !! col /= Nothing = Left "Cell already occupied. Try again."
    | otherwise = Right $ game {
        board = updatedBoard,
        currentPlayer = nextPlayer (currentPlayer game),
        state = newState
    }
  where
    updatedBoard = take row (board game)
                   ++ [take col (board game !! row) ++ [Just player] ++ drop (col + 1) (board game !! row)]
                   ++ drop (row + 1) (board game)
    newState = if checkWin updatedBoard player then Won player
               else if isDraw updatedBoard then Draw
               else InProgress

checkWin :: Board -> Player -> Bool
checkWin board player = any (all (== Just player)) (board ++ transpose board ++ diagonals board)

isDraw :: Board -> Bool
isDraw board = all (/= Nothing) (concat board)

nextPlayer :: Player -> Player
nextPlayer X = O
nextPlayer O = X

diagonals :: Board -> [[Maybe Player]]
diagonals board = [mainDiagonal board, antiDiagonal board]

mainDiagonal :: Board -> [Maybe Player]
mainDiagonal board = [board !! i !! i | i <- [0..n-1]]
  where n = length board

antiDiagonal :: Board -> [Maybe Player]
antiDiagonal board = [board !! i !! (n - i - 1) | i <- [0..n-1]]
  where n = length board

-- Transpose the board (rotate it 90 degrees)
transpose :: [[a]] -> [[a]]
transpose [] = []
transpose x
  | all null x = []
  | otherwise = map safeHead x : transpose (map safeTail x)
  where
    safeHead [] = error "Unexpected empty list in safeHead"
    safeHead (y:_) = y
    safeTail [] = []
    safeTail (_:ys) = ys
