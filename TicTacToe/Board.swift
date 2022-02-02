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

    public var board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)

    public func resetBoard() {
        board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    }

    private let winningCombinations = [
                                [[1,1,1],[0,0,0],[0,0,0]], //0,1,2
                                [[0,0,0],[1,1,1],[0,0,0]], //3,4,5
                                [[0,0,0],[0,0,0],[1,1,1]], //6,7,8

                                [[1,0,0],[1,0,0], [1,0,0]], //0,3,6
                                [[0,1,0],[0,1,0], [0,1,0]], //1,4,7
                                [[0,0,1],[0,0,1], [0,0,1]], //2,5,8

                                [[1,0,0],[0,1,0], [0,0,1]], //0,4,8
                                [[0,0,1],[0,1,0], [1,0,0]], //2,4,6
                                ]

    public func checkResult() -> GameState {
        if checkForWinner(val: 1) {
            return .PlayerXWins
        } else if checkForWinner(val: 2) {
            return .PlayerOWins
        } else {
            var xCount = 0, oCount = 0, dotCount = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    switch board[i][j] {
                    case 1:
                        xCount += 1
                    case 2:
                        oCount += 1
                    default:
                        dotCount += 1
                    }
                }
            }

            if dotCount == 0 {
                return .Draw
            } else if xCount > oCount {
                return .PlayerOTurn
            } else {
                return .PlayerXTurn
            }
        }
    }

    private func checkForWinner(val: Int) -> Bool {
        var counter = 0
        for combination in winningCombinations {
            counter = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    if combination[i][j] == 1 {
                        if board[i][j] == val {
                            counter += 1
                        }
                    }
                }
            }
            if (counter == 3) {
                return true
            }
        }
        return false
    }

}
