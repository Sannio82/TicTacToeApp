
import UIKit

class PlayGameViewController: UIViewController {
    
    @IBOutlet weak var buttonPlayAgain: UIButton!
    @IBOutlet weak var label: UILabel!
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var player1 = ""
    let segueToFirstVC = "segueToFirstVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "You chose \(player1)"
        if player1 == "X" {
            activePlayer = 1
        }else{
            activePlayer = 2
        }
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        buttonPlayAgain.isHidden = true
        label.isHidden = true
        if(gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true) {
            gameState[(sender as AnyObject).tag-1] = activePlayer
            if (activePlayer == 1) {
                (sender as AnyObject).setImage(UIImage(named: "TictactoeXEdited"), for: UIControl.State())
                activePlayer = 2
                
            }else{
                (sender as AnyObject).setImage(UIImage(named: "TictactoeOEdited"), for:
                                                UIControl.State())
                activePlayer = 1
                
            }
            
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                buttonPlayAgain.isHidden = false
                label.isHidden = false
                if gameState[combination[0]] == 1 {
                    label.text = ("X won!")
                    
                }else{
                    label.text = ("O won!")
                }
            }
            }
        var count = 0
        if gameIsActive == true {
            for i in gameState {
                if i != 0 {
                    count += 1
                }
            }
            if count == 9 {
                label.text = "Draw!"
                label.isHidden = false
                buttonPlayAgain.isHidden = false
            }
        }
        
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        
        performSegue(withIdentifier: segueToFirstVC, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueToFirstVC {
            reset()
        }
        
        func reset() {
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
}






