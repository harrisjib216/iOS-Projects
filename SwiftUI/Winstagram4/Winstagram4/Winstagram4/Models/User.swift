//
//  User.swift
//  Winstagram4
//
//  Created by jibril harris on 7/14/25.
//

import Foundation

struct User: Identifiable, Hashable, Equatable {
    var id: UUID
    var username: String
    var profileImg: URL
    
    init(id: UUID, username: String, profileImg: String) {
        self.id = id
        self.username = username
        self.profileImg = URL(string: profileImg)!
    }
    

    static let samples = [
        User(
            id: UUID(uuidString: "C0A953DF-8FB2-452F-B3C4-8D2103A89E85")!,
            username: "alphabetsoup",
            profileImg: "https://images.pexels.com/photos/32979111/pexels-photo-32979111.jpeg"
        ),
        User(
            id: UUID(uuidString: "5DEA05BE-3D1B-4135-9027-9668F20EC96F")!,
            username: "sasha",
            profileImg: "https://images.pexels.com/photos/1821095/pexels-photo-1821095.jpeg"
        ),
    ]
}
