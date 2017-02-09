//
//  ViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 1/25/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func loginAction(_ sender: Any) {
        save()
    }
    
    func save(){
        UserDefaults.standard.set(emailField.text, forKey: "email")
    }

}

