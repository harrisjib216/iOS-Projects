//
//  EmailViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/3/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase


class EmailViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var signup: UIButton!
    let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    
    
    // view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        signup.newRadius(button: signup, radius: 10)
    }
    
    
    // create account
    @IBAction func signupBtn(_ sender: Any) {
        if (nameField.text != "" && emailField.text != "" && passField.text != "") {
            create(name: nameField.text!, email: emailField.text!, pass: passField.text!)
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
    func create(name: String, email: String, pass: String) {
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, err in
            if (err != nil) {
                self.alert.title = "Uh oh!"
                self.alert.message = err?.localizedDescription
                self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(self.alert, animated: true, completion: nil)
            }
            else {
                let user = (authResult?.user.uid)!
                Database.database().reference().child("users").child(user).setValue(["name": name])
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
