//
//  Student.swift
//  BookWorm
//
//  Created by jibril harris on 5/16/25.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
