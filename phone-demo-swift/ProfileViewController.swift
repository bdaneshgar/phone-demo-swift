//
//  ProfileViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 1/30/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false

        
        emailLabel.text = UserDefaults.standard.string(forKey: "email")

        // Do any additional setup after loading the view.
    }

       @IBAction func logOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "email")
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        UserDefaults.standard.set(nil, forKey: "email")
    }

}
