//
//  SignInViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/21/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import FirebaseAuth


class SignInViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var signin: UIButton!
    let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    
    
    // when view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        signin.newRadius(button: signin, radius: 10)
    }
    
    
    // sign in
    @IBAction func signinBtn(_ sender: Any) {
        if (emailField.text != "" && passField.text != "") {
            authen(email: emailField.text!, pass: passField.text!)
        }
        else {
            // alert if incomplete
            self.alert.title = "Whoa!"
            self.alert.message = "Fields cannot be empty"
            self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // authenticate with FirB email
    func authen(email: String, pass: String) {
        Auth.auth().signIn(withEmail: email, password: pass) { (res, err) in
            if (err != nil) {
                self.alert.title = "Uh oh!"
                self.alert.message = err?.localizedDescription
                self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(self.alert, animated: true, completion: nil)
            }
            else {
                self.handleNav(view: "HomeVC")
            }
        }
    }
    
    
    // nav to new screen
    func handleNav(view: String) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: view)
        self.present(home!, animated: false, completion: nil)
    }
}
