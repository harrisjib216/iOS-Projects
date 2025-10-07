//
//  PostModel.swift
//  Winstagram
//
//  Created by objcmate on 2/19/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import Foundation


class PostModel {
    var profile: String
    var author: String
    var date: String
    var desc: String
    var post: String
    var wins: Int
    var postID: String
    
    
    // set values
    init(postID: String, dict: [String: AnyObject]) {
        self.postID = postID
        self.profile = dict["pro"] as! String
        self.author = dict["author"] as! String
        self.date = dict["date"] as! String
        self.post = dict["post"] as! String
        self.wins = dict["wins"] as! Int
        self.desc = dict["desc"] as! String
    }
    
    
    // get post
    func get() -> Array<Any> {
        return [
            self.postID,
            self.profile,
            self.author,
            self.date,
            self.post,
            self.wins,
            self.desc
        ]
    }
}
