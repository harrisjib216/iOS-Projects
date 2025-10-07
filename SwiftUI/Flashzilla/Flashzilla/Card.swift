//
//  Card.swift
//  Flashzilla
//
//  Created by jibril harris on 6/24/25.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Comprar in english", answer: "To buy")
}
