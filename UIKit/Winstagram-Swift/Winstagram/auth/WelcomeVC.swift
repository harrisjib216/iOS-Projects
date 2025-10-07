//
//  ViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/3/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var emailOutlet: UIButton!
    @IBOutlet weak var phoneOutlet: UIButton!
    @IBOutlet weak var facebookOutlet: UIButton!
    
    
    
    // view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        emailOutlet.newRadius(button: emailOutlet, radius: 10)
        phoneOutlet.newRadius(button: phoneOutlet, radius: 10)
        facebookOutlet.newRadius(button: facebookOutlet, radius: 10)
    }
}
