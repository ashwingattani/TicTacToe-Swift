//
//  Board.swift
//  TicTacToe
//
//  Created by Ashwin Gattani on 02/02/22.
//

//9*9 board with 1st player as X and second as O
class Board {

    public enum GameState : String {
        case PlayerXTurn = "Player X turn"
        case PlayerOTurn = "Player O turn"
        case Draw = "Its a Draw!!"
        case PlayerXWins = "Player X Wins!!"
        case PlayerOWins = "Player O Wins!!"
    }
    
    var currentTurnValue = 1

    public var board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)

    public func resetBoard() {
        currentTurnValue = 1
        board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    }
    
    

//    private let winningCombinations = [
//                                [[1,1,1],[0,0,0],[0,0,0]], //0,1,2
//                                [[0,0,0],[1,1,1],[0,0,0]], //3,4,5
//                                [[0,0,0],[0,0,0],[1,1,1]], //6,7,8
//
//                                [[1,0,0],[1,0,0], [1,0,0]], //0,3,6
//                                [[0,1,0],[0,1,0], [0,1,0]], //1,4,7
//                                [[0,0,1],[0,0,1], [0,0,1]], //2,5,8
//
//                                [[1,0,0],[0,1,0], [0,0,1]], //0,4,8
//                                [[0,0,1],[0,1,0], [1,0,0]], //2,4,6
//                                ]
    
    public func checkTurn() -> Int {
        return currentTurnValue
    }
    
    public func next() -> Bool {
        var dotCount = 0
        for i in 0..<3 {
            for j in 0..<3 {
                if board[i][j] != 1 && board[i][j] != 2 {
                    dotCount += 1
                }
            }
        }

        if dotCount == 0 {
            return false
        } else {
            currentTurnValue = currentTurnValue == 1 ? 2 : 1
            return true
        }
    }

//    public func checkResult() -> GameState {
//        if checkForWinner(val: 1) {
//            return .PlayerXWins
//        } else if checkForWinner(val: 2) {
//            return .PlayerOWins
//        } else {
//            var xCount = 0, oCount = 0, dotCount = 0
//            for i in 0..<3 {
//                for j in 0..<3 {
//                    switch board[i][j] {
//                    case 1:
//                        xCount += 1
//                    case 2:
//                        oCount += 1
//                    default:
//                        dotCount += 1
//                    }
//                }
//            }
//
//            if dotCount == 0 {
//                return .Draw
//            } else if xCount > oCount {
//                return .PlayerOTurn
//            } else {
//                return .PlayerXTurn
//            }
//        }
//    }
    
    public func checkIfCurrentPlayerWins(i: Int, j: Int) -> Bool {
        var isWinning = false
        
        if checkRight(i,j) {
            isWinning = checkLeft(i,j)
        }
        
        if !isWinning && checkBottom(i, j) {
            isWinning = checkTop(i, j)
        }
        
        if !isWinning {
            if i==j {
                isWinning = checkRightDiagonal(i, j)
            } else if i+j == 2 {
                isWinning = checkLeftDiagonal(i, j)
            }
        }
        
        return isWinning
    }
    
    private func checkRight(_ i: Int, _ j: Int) -> Bool {
        if j<2 {
            if board[i][j+1] == currentTurnValue {
                return checkRight(i, j+1)
            } else {
                return false
            }
        }
        return board[i][j] == currentTurnValue
    }
    
    private func checkLeft(_ i: Int, _ j: Int) -> Bool {
        if j>0 {
            if board[i][j-1] == currentTurnValue {
                return checkLeft(i, j-1)
            } else {
                return false
            }
        }
        return board[i][j] == currentTurnValue
    }
    
    private func checkBottom(_ i: Int, _ j: Int) -> Bool {
        if i<2 {
            if board[i+1][j] == currentTurnValue {
                return checkBottom(i+1, j)
            } else {
                return false
            }
        }
        return board[i][j] == currentTurnValue
    }
    
    private func checkTop(_ i: Int, _ j: Int) -> Bool {
        if i>0 {
            if board[i-1][j] == currentTurnValue {
                return checkTop(i-1, j)
            } else {
                return false
            }
        }
        return board[i][j] == currentTurnValue
    }
    
    private func checkRightDiagonal(_ i: Int, _ j: Int, _ reverse: Bool = false) -> Bool {
        if !reverse && i>=0 && i<2 {
            if board[i+1][j+1] == currentTurnValue {
                return checkRightDiagonal(i+1, j+1)
            } else {
                return false
            }
        } else if i<=2 && i>0 {
            if board[i-1][j-1] == currentTurnValue {
                return checkRightDiagonal(i-1, j-1, true)
            } else {
                return false
            }
        }
        
        return board[i][j] == currentTurnValue
    }
    
    private func checkLeftDiagonal(_ i: Int, _ j: Int, _ reverse: Bool = false) -> Bool {
        if !reverse && j>=0 && j<2 {
            if board[i-1][j+1] == currentTurnValue {
                return checkLeftDiagonal(i-1, j+1)
            } else {
                return false
            }
        } else if j<=2 && j>0 {
            if board[i+1][j-1] == currentTurnValue {
                return checkLeftDiagonal(i+1, j-1, true)
            } else {
                return false
            }
        }
        
        return board[i][j] == currentTurnValue
    }

    private func checkForWinner(val: Int) -> Bool {
//        var counter = 0
//        for combination in winningCombinations {
//            counter = 0
//            for i in 0..<3 {
//                for j in 0..<3 {
//                    if combination[i][j] == 1 {
//                        if board[i][j] == val {
//                            counter += 1
//                        }
//                    }
//                }
//            }
//            if (counter == 3) {
//                return true
//            }
//        }
//
//
//
        return false
    }

}
