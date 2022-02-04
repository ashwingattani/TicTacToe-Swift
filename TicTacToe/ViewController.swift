//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ashwin Gattani on 02/02/22.
//

import UIKit

class ViewController: UIViewController {

    var board = Board()
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = board.checkTurn() == 1 ? "Player X Turn" : "Player O Turn"
    }

    @IBAction func buttonTapped(sender: UIButton) {
        if sender.title(for: .normal) != "---" {return}
        
        let buttonText = board.checkTurn() == 1 ? "X" : "O"
        let labelText = board.checkTurn() == 1 ? "Player O Turn" : "Player X Turn"
//        var buttonValue: Int
//        switch board.checkResult() {
//            case .PlayerXTurn:
//                buttonText = "X"
//                buttonValue = 1
//            case .PlayerOTurn:
//                buttonText = "O"
//                buttonValue = 2
//            default:
//                buttonText = "---"
//                buttonValue = 0
//        }
        
        let i = (sender.tag-1)/3
        let j = (sender.tag-1)%3
        
        board.board[i][j] = board.checkTurn()
        sender.setTitle(buttonText, for: .normal)
        resultLabel.text = labelText
        
        if board.checkIfCurrentPlayerWins(i: i, j: j) {
            resultLabel.text = board.checkTurn() == 1 ? "Player X Wins" : "Player O Wins"
        } else {
            if !board.next() {
                resultLabel.text = "Its a Draw"
            }
        }
    }

    @IBAction func reset(sender: UIButton) {
        board.resetBoard()
        resultLabel.text = board.checkTurn() == 1 ? "Player X Turn" : "Player O Turn"
        
        for i in 1...9 {
            (self.view.viewWithTag(i) as! UIButton).setTitle("---", for: .normal)
        }
    }
}

