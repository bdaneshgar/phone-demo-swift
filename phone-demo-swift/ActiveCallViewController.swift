//
//  ActiveCallViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 2/7/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit

class ActiveCallViewController: UIViewController {

    @IBOutlet var endCall: UIButton!
    
    @IBOutlet var muteBtn: UIButton!
    @IBOutlet var keypadBtn: UIButton!
    @IBOutlet var speakerBtn: UIButton!
    
    @IBOutlet var textField: UITextField!
    
    var mute = false
    var keypad = false
    var speaker = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endCall.layer.cornerRadius = 0.5 * endCall.bounds.size.width
        muteBtn.layer.cornerRadius = 0.5 * muteBtn.bounds.size.width
        keypadBtn.layer.cornerRadius = 0.5 * keypadBtn.bounds.size.width
        speakerBtn.layer.cornerRadius = 0.5 * speakerBtn.bounds.size.width
        
        
        muteBtn.layer.borderWidth = 1
        muteBtn.layer.borderColor = UIColor.white.cgColor
        
        keypadBtn.layer.borderWidth = 1
        keypadBtn.layer.borderColor = UIColor.white.cgColor
        
        speakerBtn.layer.borderWidth = 1
        speakerBtn.layer.borderColor = UIColor.white.cgColor

        UIDevice.current.isProximityMonitoringEnabled = true
    }

    @IBAction func toggleMute(_ sender: Any) {
        if(mute){
            muteBtn.backgroundColor = UIColor.black
            mute = false
        } else {
            muteBtn.backgroundColor = UIColor.gray
            mute = true
        }
    }

    @IBAction func toggleKeypad(_ sender: Any) {
        if(keypad){
            keypadBtn.backgroundColor = UIColor.black
            keypad = false
        } else {
            keypadBtn.backgroundColor = UIColor.gray
            keypad = true
        }
    }
    
    
    @IBAction func toggleSpeaker(_ sender: Any) {
        if(speaker){
            speakerBtn.backgroundColor = UIColor.black
            speaker = false
        } else {
            speakerBtn.backgroundColor = UIColor.gray
            speaker = true
        }
    }
    
    
    @IBAction func endCall(_ sender: Any) {
        /* Unwind Segue */
        dismiss(animated: true, completion: nil)
    }

}
