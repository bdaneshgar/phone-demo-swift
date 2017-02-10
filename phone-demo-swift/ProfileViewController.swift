//
//  ProfileViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 1/30/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var numbers: UIPickerView!
    
    var pickerData: [String] = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //picker
        self.numbers.delegate = self
        self.numbers.dataSource = self
        pickerData = ["phone number 1", "phone number 2", "phone number 3", "phone number 4"]
        
        self.navigationController?.isNavigationBarHidden = false

        
        emailLabel.text = UserDefaults.standard.string(forKey: "email")

        // Do any additional setup after loading the view.
        
        numbers.selectRow(UserDefaults.standard.integer(forKey: "number"), inComponent: 0, animated: true)

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        UserDefaults.standard.set(row, forKey: "number")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    @IBAction func logOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "email")
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "number")
    }

}
