//
//  ViewController.swift
//  SwiftyDice_TPK
//
//  Created by Truett Knox on 10/14/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(){
        rollDice()
    }
    
    func rollDice(){
        //do cool stuff here
        print("We Rollin' Dice!")
        
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if(imageName == "d1"){
            criticalLabel.text = "Critical Miss!"
        }else if(imageName == "d20"){
            criticalLabel.text = "Critical Hit!"
        }else{
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
}

