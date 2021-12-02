//
//  ViewController.swift
//  TicTacToe
//
//  Created by Susanna Johansson on 2021-11-25.
//

import UIKit

class ViewController: UIViewController {
    
    var player1 : String?
    let segueToPlayViewId = "segueToPlayView"
    
    @IBOutlet weak var buttonGo: UIButton!
    
    @IBOutlet weak var imageO: UIImageView!
    
    @IBOutlet weak var imageX: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func imageOTapped(_ sender: Any) {
        player1 = "O"
    }
    
    @IBAction func imageXTapped(_ sender: Any) {
        player1 = "X"
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
           performSegue(withIdentifier: segueToPlayViewId, sender: self)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToPlayViewId {
            let destinationVC = segue.destination as! PlayGameViewController
            destinationVC.player1 = self.player1 ?? "Z"
        }
    }
    

}

