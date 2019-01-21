//
//  TextSpeechViewController.swift
//  Text To Speech
//
//  Created by Liam Flaherty on 1/21/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit
import AVFoundation

class TextSpeechViewController: UIViewController {

    @IBOutlet weak var textSpeech: UITextView!
    @IBOutlet weak var pauseBtn: UIBarButtonItem!
    @IBOutlet weak var stopBTN: UIBarButtonItem!
    
    let speechSyn = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pauseBtn.isEnabled = false
        self.stopBTN.isEnabled = false
    }
    

    @IBAction func Pause(_ sender: Any) {
       speechSyn.pauseSpeaking(at: AVSpeechBoundary.immediate)
        self.pauseBtn.isEnabled = false
    }
    
    @IBAction func Play(_ sender: Any) {
        if(speechSyn.isPaused){
            speechSyn.continueSpeaking()
        }
            
        else{
            let speech = AVSpeechUtterance(string: textSpeech.text)
            speech.voice = AVSpeechSynthesisVoice(language: "en-US")
            speech.rate = 0.2
            
            speechSyn.speak(speech)
        }
        self.pauseBtn.isEnabled = true
        self.stopBTN.isEnabled = true
    }
    
    @IBAction func Stop(_ sender: Any) {
        speechSyn.stopSpeaking(at: AVSpeechBoundary.immediate)
        self.stopBTN.isEnabled = false
    }
    

    
}
