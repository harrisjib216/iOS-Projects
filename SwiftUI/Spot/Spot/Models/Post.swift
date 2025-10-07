//
//  Post.swift
//  Spot
//
//  Created by development on 3/7/25.
//

import Foundation
import SwiftData

@Model
final class Post {
    var timestamp: Date
    var caption: String
    var author: User
    var imageUrl: String
    
    init(timestamp: Date, caption: String, author: User, imageUrl: String) {
        self.timestamp = timestamp
        self.caption = caption
        self.author = author
        self.imageUrl = imageUrl
    }
}
