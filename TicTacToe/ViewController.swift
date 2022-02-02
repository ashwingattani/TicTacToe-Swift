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
        resultLabel.text = board.checkResult().rawValue
    }

    @IBAction func buttonTapped(sender: UIButton) {
        if sender.title(for: .normal) != "---" {return}
        
        var buttonText: String
        var buttonValue: Int
        switch board.checkResult() {
            case .PlayerXTurn:
                buttonText = "X"
                buttonValue = 1
            case .PlayerOTurn:
                buttonText = "O"
                buttonValue = 2
            default:
                buttonText = "---"
                buttonValue = 0
        }
        
        board.board[(sender.tag-1)/3][(sender.tag-1)%3] = buttonValue
        sender.setTitle(buttonText, for: .normal)
        resultLabel.text = board.checkResult().rawValue
    }

    @IBAction func reset(sender: UIButton) {
        board.resetBoard()
        resultLabel.text = board.checkResult().rawValue
        
        for i in 1...9 {
            (self.view.viewWithTag(i) as! UIButton).setTitle("---", for: .normal)
        }
    }
}

