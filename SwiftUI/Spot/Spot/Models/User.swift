//
//  User.swift
//  Spot
//
//  Created by development on 3/7/25.
//

import Foundation
import SwiftData

@Model
final class User {
    var id: String
    var firstName: String
    var lastName: String
    
    init(id: String, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
}
