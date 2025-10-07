//
//  Location.swift
//  Bucket List
//
//  Created by jibril harris on 6/7/25.
//

import MapKit
import Foundation

struct Location: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(id: UUID, name: String, description: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }

#if DEBUG
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Lit over 40k lightbulbs", latitude: 51.501, longitude: -0.141)
#endif
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
