//
//  HomeTableViewCell.swift
//  Winstagram
//
//  Created by objcmate on 2/4/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import FirebaseDatabase


class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var content: UITextView!
    var pressed:Bool = false
    var postID:String!
    
        
    // render each cell
    func render(data: Array<Any>) {
        // text - post set up
        self.postID = data[0] as? String
        self.nameLabel.text = data[2] as? String
        self.dateLabel.text = data[3] as? String
        self.winsLabel.text = "\(data[5])"
        self.content.text = data[6] as? String
        
        
        // profile - post pic
        let url0 = URL(string: data[1] as! String)!
        let url1 = URL(string: data[4] as! String)!
        
        DispatchQueue.global().async {
            let img0 = try? Data(contentsOf: url0)
            let img1 = try? Data(contentsOf: url1)

            DispatchQueue.main.async {
                self.profilePic.image = UIImage(data: img0!)
                self.profilePic.border(img: self.profilePic)
                self.postImg.image = UIImage(data: img1!)
            }
        }
    }
    
    
    // pressing wins button
    @IBAction func winBtn(_ sender: Any) {
        let ref = Database.database().reference().child("posts/\(self.postID!)/wins")
        pressed = !pressed

        ref.observeSingleEvent(of: .value, with: { (snap) in
            let wins = snap.value as! Int
            
            if (self.pressed) {
                ref.setValue(wins + 1)
                self.winsLabel.text = "\(wins + 1)"
                self.winsLabel.textColor = UIColor(hex: 0x2E7D32)
            }
            else {
                ref.setValue(wins - 1)
                self.winsLabel.text = "\(wins - 1)"
                self.winsLabel.textColor = .red
            }
        })
    }
}
