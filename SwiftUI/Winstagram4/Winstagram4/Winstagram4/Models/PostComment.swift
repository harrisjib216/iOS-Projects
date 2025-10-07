//
//  PostComment.swift
//  Winstagram4
//
//  Created by jibril harris on 7/15/25.
//

import Foundation

struct PostComment: Identifiable {
    var id: UUID
    var author: User
    var content: String
    var timestamp: Date
}
