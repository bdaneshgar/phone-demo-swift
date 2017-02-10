//
//  SignUpViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 1/30/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var emailField: UITextField!

    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpAction(_ sender: Any) {
        save()
    }

    func save(){
        UserDefaults.standard.set(emailField.text, forKey: "email")
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
