//
//  Favorites.swift
//  SnowSeeker
//
//  Created by jibril harris on 6/26/25.
//

import Foundation

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "favorites"
    
    init() {
        // load save data
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        //
    }
}
