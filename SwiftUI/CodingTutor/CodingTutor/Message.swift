//
//  Message.swift
//  CodingTutor
//
//  Created by jibril harris on 7/8/25.
//

import Foundation

struct Message: Equatable, Identifiable {
    var id = UUID().uuidString
    var text: String
    var isAi: Bool
    var timestamp = Date.now
}
