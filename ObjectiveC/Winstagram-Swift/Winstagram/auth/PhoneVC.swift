//
//  PhoneViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/18/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase


class PhoneViewController: UIViewController {
    @IBOutlet weak var numField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var send: UIButton!
    let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)

    
    
    // view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        send.newRadius(button: send, radius: 10)
    }
    
    
    // send sms
    @IBAction func sendBtn(_ sender: Any) {
        if (numField.text != "" && nameField.text != "") {
            create(name: nameField.text!, phone: numField.text!)
        }
        else {
            // alert if incomplete
            self.alert.title = "Whoa!"
            self.alert.message = "Fields cannot be empty"
            self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // create the user in FB, handle errors
    func create(name: String, phone: String) {
        Auth.auth().languageCode = "en"
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { (verificationID, err) in
            if (err != nil) {
                self.alert.title = "Uh oh!"
                self.alert.message = err?.localizedDescription
                self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            }
            else {
                self.handleNav(view: "HomeVC")
                print("id: " + verificationID!)
            }
        }
    }
    
    
    // nav to new screen
    func handleNav(view: String) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: view)
        self.present(home!, animated: false, completion: nil)
    }
}
