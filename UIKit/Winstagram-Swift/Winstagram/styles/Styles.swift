//
//  Styles.swift
//  Winstagram
//
//  Created by objcmate on 2/3/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit


extension UIButton {    
    func newRadius(button: UIButton, radius: CGFloat) {
        button.layer.cornerRadius = radius
    }
}


extension UIImageView {
    func border(img: UIImageView) {
        img.layer.borderWidth = 3.0
        img.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
    }
}


extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
