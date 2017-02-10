//
//  PhoneViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 1/30/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import AudioToolbox


protocol ContactDelegate {
    func didFetchContacts(_ contacts: [CNContact])
}


class PhoneViewController: UIViewController, CNContactPickerDelegate {
    @IBOutlet var numberField: UITextField!
    
    @IBOutlet var delete: UIButton!
    @IBOutlet var profile: UIButton!
    
    var isOnCall = false
    @IBOutlet var callBtn: UIButton!
    @IBOutlet var callImage: UIButton!

    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var seven: UIButton!
    @IBOutlet var eight: UIButton!
    @IBOutlet var nine: UIButton!
    @IBOutlet var zero: UIButton!
    @IBOutlet var asterisk: UIButton!
    @IBOutlet var hashtag: UIButton!
    
    @IBOutlet var contacts: UIButton!
    
    
    
    var delegate: ContactDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        testSIP()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func deleteAction(_ sender: Any) {
//        numberField.text = ""
        if(numberField.text != "" ){
            let endIndex = numberField.text?.index((numberField.text?.endIndex)!, offsetBy: -1)
            let truncated = numberField.text?.substring(to: endIndex!)
            numberField.text = truncated
        }
    }
    
    func call(){
        if(isOnCall){
            isOnCall = false
            numberField.text = ""
            profile.isHidden = false
            delete.isHidden = false
            contacts.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                self.callBtn.backgroundColor = UIColor(colorLiteralRed: 86.0/255.0, green: 255.0/255.0, blue: 80.0/255.0, alpha: 1.0)
                let angle =  CGFloat(0)
                let tr = CGAffineTransform.identity.rotated(by: angle)
                self.callImage.transform = tr
            }) {(Bool) -> Void in
            }
        } else{
            isOnCall = true
            profile.isHidden = true
            delete.isHidden = true
            contacts.isHidden = true
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                self.callBtn.backgroundColor = UIColor(colorLiteralRed: 255.0/255.0, green: 98.0/255.0, blue: 89.0/255.0, alpha: 1.0)
                let angle =  CGFloat(M_PI_2 + M_PI_2/2)
                let tr = CGAffineTransform.identity.rotated(by: angle)
                self.callImage.transform = tr
            }) {(Bool) -> Void in
            }
            
        }
    }
    
    @IBAction func callBtnAction(_ sender: Any) {
        call()
    }
    @IBAction func callImageAction(_ sender: Any) {
        call()
    }

    func animate(sender: UIButton){
        let red   = Float((arc4random() % 256)) / 255.0
        let green = Float((arc4random() % 256)) / 255.0
        let blue  = Float((arc4random() % 256)) / 255.0
        let alpha = Float(0.5)
        
        UIView.animate(withDuration: 0.05, delay: 0, options: [UIViewAnimationOptions.allowUserInteraction, .autoreverse], animations: { () -> Void in
            sender.backgroundColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        }) {(Bool) -> Void in
            sender.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func oneAction(_ sender: Any) {
        numberField.text = numberField.text! + "1"
        AudioServicesPlaySystemSound(1201)
        
        animate(sender: sender as! UIButton)
        
    }
    
    @IBAction func twoAction(_ sender: Any) {
        numberField.text = numberField.text! + "2"
        AudioServicesPlaySystemSound(1202)
        animate(sender: sender as! UIButton)
    }
    @IBAction func threeAction(_ sender: Any) {
        numberField.text = numberField.text! + "3"
        AudioServicesPlaySystemSound(1203)
        animate(sender: sender as! UIButton)
    }
    @IBAction func fourAction(_ sender: Any) {
        numberField.text = numberField.text! + "4"
        AudioServicesPlaySystemSound(1204)
        animate(sender: sender as! UIButton)
    }
    @IBAction func fiveAction(_ sender: Any) {
        numberField.text = numberField.text! + "5"
        AudioServicesPlaySystemSound(1205)
        animate(sender: sender as! UIButton)
    }
    @IBAction func sixAction(_ sender: Any) {
        numberField.text = numberField.text! + "6"
        AudioServicesPlaySystemSound(1206)
        animate(sender: sender as! UIButton)
    }
    @IBAction func sevenAction(_ sender: Any) {
        numberField.text = numberField.text! + "7"
        AudioServicesPlaySystemSound(1207)
        animate(sender: sender as! UIButton)
    }
    @IBAction func eightAction(_ sender: Any) {
        numberField.text = numberField.text! + "8"
        AudioServicesPlaySystemSound(1208)
        animate(sender: sender as! UIButton)
    }
    @IBAction func nineAction(_ sender: Any) {
        numberField.text = numberField.text! + "9"
        AudioServicesPlaySystemSound(1209)
        animate(sender: sender as! UIButton)
    }
    @IBAction func zeroAction(_ sender: Any) {
        numberField.text = numberField.text! + "0"
        AudioServicesPlaySystemSound(1200)
        animate(sender: sender as! UIButton)
    }
    @IBAction func asteriskAction(_ sender: Any) {
        numberField.text = numberField.text! + "*"
        animate(sender: sender as! UIButton)
    }
    @IBAction func hashtagAction(_ sender: Any) {
        numberField.text = numberField.text! + "#"
        animate(sender: sender as! UIButton)
    }
    
    @IBAction func profileAction(_ sender: Any) {
        
    }
    
    func setup(){
        
        callBtn.layer.cornerRadius = 0.5 * callBtn.bounds.size.width
        
        one.layer.cornerRadius = 0.5 * one.bounds.size.width
        one.backgroundColor = .clear
        one.layer.borderWidth = 1
        one.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: one)
        
        two.layer.cornerRadius = 0.5 * two.bounds.size.width
        two.backgroundColor = .clear
        two.layer.borderWidth = 1
        two.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: two)
        
        three.layer.cornerRadius = 0.5 * three.bounds.size.width
        three.backgroundColor = .clear
        three.layer.borderWidth = 1
        three.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: three)
        
        four.layer.cornerRadius = 0.5 * four.bounds.size.width
        four.backgroundColor = .clear
        four.layer.borderWidth = 1
        four.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: four)
        
        five.layer.cornerRadius = 0.5 * five.bounds.size.width
        five.backgroundColor = .clear
        five.layer.borderWidth = 1
        five.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: five)

        six.layer.cornerRadius = 0.5 * six.bounds.size.width
        six.backgroundColor = .clear
        six.layer.borderWidth = 1
        six.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: six)
        
        seven.layer.cornerRadius = 0.5 * seven.bounds.size.width
        seven.backgroundColor = .clear
        seven.layer.borderWidth = 1
        seven.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: seven)
        
        eight.layer.cornerRadius = 0.5 * eight.bounds.size.width
        eight.backgroundColor = .clear
        eight.layer.borderWidth = 1
        eight.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: eight)
        
        nine.layer.cornerRadius = 0.5 * nine.bounds.size.width
        nine.backgroundColor = .clear
        nine.layer.borderWidth = 1
        nine.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: nine)
        
        zero.layer.cornerRadius = 0.5 * zero.bounds.size.width
        zero.backgroundColor = .clear
        zero.layer.borderWidth = 1
        zero.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: zero)
        
        asterisk.layer.cornerRadius = 0.5 * asterisk.bounds.size.width
        asterisk.backgroundColor = .clear
        asterisk.layer.borderWidth = 1
        asterisk.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: asterisk)
        
        hashtag.layer.cornerRadius = 0.5 * hashtag.bounds.size.width
        hashtag.backgroundColor = .clear
        hashtag.layer.borderWidth = 1
        hashtag.layer.borderColor = UIColor.black.cgColor
        self.view.bringSubview(toFront: hashtag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func showContacts(_ sender: Any) {
        let contactPickerViewController = CNContactPickerViewController()
        contactPickerViewController.delegate = self
        present(contactPickerViewController, animated: true, completion: nil)
    }
    
    func on_incoming_call(acc_id: pjsua_acc_id, call_id: pjsua_call_id){
        print("incoming call")
    }
    
    func testSIP(){
        
        pjsua_destroy()
        
        /* Create pjsua first! */
        
        var status = pjsua_create()
        
        /* Init pjsua */
        
        var pjsua_cfg = pjsua_config()
        var log_cfg = pjsua_logging_config()
        
        pjsua_config_default(&pjsua_cfg)
        //Callbacks go here
        
        pjsua_logging_config_default(&log_cfg)
        log_cfg.console_level = 4
        
        /* Media configuration */
        
//        var media_cfg = pjsua_media_config()
//        pjsua_media_config_default(&media_cfg)
//        status = pjsua_init(&pjsua_cfg, &log_cfg, &media_cfg)

        status = pjsua_init(&pjsua_cfg, &log_cfg, nil)
        
        /* Add UDP transport */
        
        var transportConfig = pjsua_transport_config()
        
        pjsua_transport_config_default(&transportConfig)
        transportConfig.port = 5060;
        status = pjsua_transport_create(PJSIP_TRANSPORT_UDP, &transportConfig, nil)
        
//        TCP
//        pjsua_transport_create(PJSIP_TRANSPORT_TCP, &transportConfig, nil)

        /* Initialization is done, now start pjsua */
        status = pjsua_start()
        print("status: \(status)")
        print("running")
        
        /* Register to SIP server by creating SIP account. */
        
        var acc_id = pjsua_acc_id()
        var cfg = pjsua_acc_config()
        
        let SIP_USER = "roam_vzw1"
        let SIP_PASSWD = "Gotmail123"
        let SIP_DOMAIN = "66.241.96.221"
        //DID: (206)260-3561

        pjsua_acc_config_default(&cfg)
        cfg.id = pj_str(UnsafeMutablePointer(mutating: "sip:" + SIP_USER + "@" + SIP_DOMAIN))
        cfg.reg_uri = pj_str(UnsafeMutablePointer(mutating: "sip:" + SIP_DOMAIN))
        cfg.cred_count = 1
        cfg.cred_info.0.realm = pj_str(UnsafeMutablePointer(mutating: SIP_DOMAIN))
        cfg.cred_info.0.scheme = pj_str(UnsafeMutablePointer(mutating: "vitality")) //?
        cfg.cred_info.0.username = pj_str(UnsafeMutablePointer(mutating:SIP_USER))
        cfg.cred_info.0.data_type = Int32(PJSIP_CRED_DATA_PLAIN_PASSWD.rawValue)
        cfg.cred_info.0.data = pj_str(UnsafeMutablePointer(mutating:SIP_PASSWD))

        status = pjsua_acc_add(&cfg, pj_bool_t(PJ_TRUE.rawValue), &acc_id)

        print("status: \(status)")
        
    }
}
