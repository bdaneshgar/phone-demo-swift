//
//  PhoneViewController.swift
//  phone-demo-swift
//
//  Created by Brian Daneshgar on 1/30/17.
//  Copyright © 2017 Brian Daneshgar. All rights reserved.
//

import UIKit


class PhoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func testSIP(){
        pjsua_create();
        
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

        pjsua_start()

    }

}
