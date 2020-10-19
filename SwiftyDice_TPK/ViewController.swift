//
//  ViewController.swift
//  SwiftyDice_TPK
//
//  Created by Tanner Parker on 10/14/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(){
        rollDice()
    }
    
    @IBAction func Play(sender: Any){
        audioPlayer.play()
    }
    
    func rollDice(){
        //do cool stuff here
        print("We Rollin' Dice!")
        
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "rolldice", ofType: "mp3")!))
        }catch {
            print(error)
        }
        
        if(imageName == "d1"){
            criticalLabel.text = "Critical Miss!"
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "failwah", ofType: "mp3")!))
            }catch{
                print(error)
            }
        }else if(imageName == "d20"){
            criticalLabel.text = "Critical Hit!"
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "rolldice", ofType: "mp3")!))
            }catch{
                print(error)
            }
        }else{
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
}

