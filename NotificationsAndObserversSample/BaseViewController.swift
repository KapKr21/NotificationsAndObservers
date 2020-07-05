//
//  BaseViewController.swift
//  NotificationsAndObserversSample
//
//  Created by Kap's on 16/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit

let appleNotificationKey = "com.notification.apple"
let starNotificationKey = "com.notification.star"

class BaseViewController: UIViewController {

    @IBOutlet weak var choosenImage: UIImageView!
    @IBOutlet weak var choosenLabel: UILabel!
    
    let appleNotificationName = NSNotification.Name(appleNotificationKey)
    let starNotificationName  = NSNotification.Name(rawValue: starNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createObservers()
    }
    
    func createObservers() {
        
        //Apple Notification
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateImage(notification:)), name: appleNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(BaseViewController.updateLabel(notification:)), name: appleNotificationName, object: nil)
        
        //Star Notificaton
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateImage(notification:)), name: starNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateLabel(notification:)), name: starNotificationName, object: nil)
    }
    
    @objc func updateImage(notification : NSNotification) {
        
        let isApple = notification.name == appleNotificationName
        let image = isApple ? UIImage(named: "Apple") : UIImage(named: "Star")
        self.choosenImage.image = image
    }
    
    @objc func updateLabel(notification : NSNotification) {
        
        let isApple = notification.name == appleNotificationName
        let label = isApple ? "Apple was tapped" : "Star was tapped"
        self.choosenLabel.text = label
    }

    @IBAction func chooseButtonTapped(_ sender: Any) {
        
        let secondVC = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        present(secondVC, animated: true, completion: nil)
    }
}
