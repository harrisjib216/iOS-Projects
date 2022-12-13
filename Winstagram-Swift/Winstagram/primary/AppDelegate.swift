//
//  AppDelegate.swift
//  Winstagram
//
//  Created by objcmate on 2/3/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        if ((Auth.auth().currentUser) != nil) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view = storyboard.instantiateViewController(withIdentifier: "HomeVC")
            self.window?.rootViewController = view
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }
}
