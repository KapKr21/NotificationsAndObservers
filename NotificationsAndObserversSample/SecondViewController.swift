//
//  SecondViewController.swift
//  NotificationsAndObserversSample
//
//  Created by Kap's on 16/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func appleWasTapped(_ sender: Any) {
        let name = NSNotification.Name(rawValue: appleNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func starWasTapped(_ sender: Any) {
        let name = NSNotification.Name(rawValue: starNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
}
