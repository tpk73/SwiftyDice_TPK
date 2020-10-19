//
//  ViewController.swift
//  SwiftyDice_TPK
//
//  Created by Tanner Parker on 10/14/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayerRoll = AVAudioPlayer()
    var audioPlayerWin = AVAudioPlayer()
    var audioPlayerLose = AVAudioPlayer()
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            audioPlayerRoll = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "rolldice", ofType: "mp3")!))
        }catch {
            print(error)
        }
        do {
            audioPlayerLose = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "failwah", ofType: "mp3")!))
        }catch{
            print(error)
        }
        do {
            audioPlayerWin = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!))
        }catch{
            print(error)
        }
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
        
        audioPlayerRoll.play()
        
        if(imageName == "d1"){
            criticalLabel.text = "Critical Miss!"
            audioPlayerLose.play()
      
        }else if(imageName == "d20"){
            criticalLabel.text = "Critical Hit!"
            audioPlayerWin.play()

        }else{
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
}

