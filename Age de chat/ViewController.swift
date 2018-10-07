//
//  ViewController.swift
//  Age de chat
//
//  Created by Afonso, Nicolas on 01/10/2018.
//  Copyright © 2018 CA Technologies Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ComputeAge(_ sender: Any) {
        
        //Close the keyboard input
        view.endEditing(true)
        
        //Check the user input
        if userInput.text != nil  {
            let input = userInput.text!
            
            if let age = Int(input) {
                let ageConverted = age * 7
                resultLabel.text = "Vous avez \(ageConverted) ans en âge de chat !"
            }
        }
    }
    
    @IBAction func SynthetizeResult(_ sender: Any) {
        
        if let label = resultLabel.text  {
            //Initialize AVSpeechSynthesizer
            let speech = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: label)
            utterance.rate = 0.5
            utterance.voice = AVSpeechSynthesisVoice(language: "fr_FR")
            speech.speak(utterance)
        }
    }
}

