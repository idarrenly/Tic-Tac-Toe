//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by dly on 10/14/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 is noughts, 2 is crosses
    var activePlayer = 1
    
    //0 is empty, 1 is nought, 2 is cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    //Once there is a winner this becomes false
     var activeGame = true
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //Tag ID
        //print("button \(sender.tag) pressed")
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                //Set image to nought
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
            } else {
                //Set image to cross
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    //Winner!!!
                    activeGame = false
                    //print(gameState[combination[0]])
                    
                    //Set label to winner
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Noughts has won!"
                    } else {
                        winnerLabel.text = "Crosses has won!"
                    }
                    
                    //Reveal labels
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    //Transition Effects
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                }
            }
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        
        //Reset Game
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        
        //Clear the images on the buttons
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [] )
            }
        }
        
        //Hide label and prep transitions
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

