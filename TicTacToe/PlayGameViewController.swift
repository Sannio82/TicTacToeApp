//
//  PlayGameViewController.swift
//  TicTacToe
//
//  Created by Susanna Johansson on 2021-11-26.
//

import UIKit

class PlayGameViewController: UIViewController {

    @IBOutlet weak var buttonPlayAgain: UIButton!
    @IBOutlet weak var label: UILabel!
    var count = 1
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var player1 = ""
    
   
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
       label.text = "You chose \(player1)"
        
   }
 
            

    @IBAction func buttonPressed(_ sender: AnyObject) {
    
        if(gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true) {
            gameState[(sender as AnyObject).tag-1] = activePlayer
                if (activePlayer == 1) {
                    (sender as AnyObject).setImage(UIImage(named: "X2"), for: UIControl.State())
                    activePlayer = 2
                    print(activePlayer)
                }else {
                    (sender as AnyObject).setImage(UIImage(named: "O2"), for:
                        UIControl.State())
                    activePlayer = 1
                    print(activePlayer)
                }
            
    }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    label.text = ("Cross has won!")
                }else{
                label.text = ("Circle has won!")
            }
                
                if gameIsActive == true {
                    for i in gameState {
                        count = i*count
                    }
                    if count != 0 {
                     label.text = "It was a draw!"
                        label.isHidden = false
                        buttonPlayAgain.isHidden = false
                    }
                }
                
                buttonPlayAgain.isHidden = false
                label.isHidden = false
    
            }
        }
        
        
        }
    
    @IBAction func playAgain(_ sender: Any) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        buttonPlayAgain.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
 
}