//
//  Prospects.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/23/25.
//

import SwiftData

@Model
class Prospect {
    var name: String
    var email: String
    var isContacted: Bool
    
    init(name: String, email: String, isContacted: Bool) {
        self.name = name
        self.email = email
        self.isContacted = isContacted
    }
}
