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

protocol ContactDelegate {
    func didFetchContacts(_ contacts: [CNContact])
}


class PhoneViewController: UIViewController, CNContactPickerDelegate {

    var delegate: ContactDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testSIP()
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
    
    func testSIP(){
        
        pjsua_destroy()
        
        pjsua_create()
        
        var configuration = pjsua_config()
        var log_cfg = pjsua_logging_config()
        var media_cfg = pjsua_media_config()
        
        pjsua_config_default(&configuration)
        pjsua_logging_config_default(&log_cfg)
        pjsua_media_config_default(&media_cfg)
        
        pjsua_init(&configuration, &log_cfg, &media_cfg)
        
        var transportConfig = pjsua_transport_config()
        
        pjsua_transport_config_default(&transportConfig)
        
        transportConfig.port = 5060;
        
        pjsua_transport_create(PJSIP_TRANSPORT_UDP, &transportConfig, nil)
        pjsua_transport_create(PJSIP_TRANSPORT_TCP, &transportConfig, nil)

        var status = pjsua_start()
        
        var acc_id = pjsua_acc_id()
        var cfg = pjsua_acc_config()

        pjsua_acc_config_default(&cfg)
        cfg.id = pj_str(UnsafeMutablePointer(mutating: "roam_vzw1@66.241.96.221"))
        cfg.reg_uri = pj_str(UnsafeMutablePointer(mutating: "66.241.96.221"))
        
        status = pjsua_acc_add(&cfg, pj_bool_t(PJ_TRUE.rawValue), &acc_id)

        print("status: \(status)")
        
    }
}
