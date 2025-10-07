//
//  UserProfile.swift
//  Winstagram4
//
//  Created by jibril harris on 7/24/25.
//

import Foundation

struct UserProfile: Identifiable {
    var id: UUID
    var username: String
    var profileImg: URL
    var bio: String
    var numPosts: Int
    var numFollowers: Int
    var numFollowing: Int
    var isViewerFollowing: Bool
    
    init(
        id: UUID,
        username: String,
        profileImg: String,
        bio: String,
        numPosts: Int,
        numFollowers: Int,
        numFollowing: Int,
        isViewerFollowing: Bool
    ) {
        self.id = id
        self.username = username
        self.profileImg = URL(string: profileImg)!
        self.bio = bio
        self.numPosts = numPosts
        self.numFollowers = numFollowers
        self.numFollowing = numFollowing
        self.isViewerFollowing = isViewerFollowing
    }
    

    static let samples = [
        UserProfile(
            id: UUID(uuidString: "C0A953DF-8FB2-452F-B3C4-8D2103A89E85")!,
            username: "alphabetsoup",
            profileImg: "https://images.pexels.com/photos/32979111/pexels-photo-32979111.jpeg",
            bio: "I love to love",
            numPosts: 1,
            numFollowers: 42,
            numFollowing: 40,
            isViewerFollowing: false
        ),
        UserProfile(
            id: UUID(uuidString: "5DEA05BE-3D1B-4135-9027-9668F20EC96F")!,
            username: "sasha",
            profileImg: "https://images.pexels.com/photos/1821095/pexels-photo-1821095.jpeg",
            bio: "Faith",
            numPosts: 1,
            numFollowers: 51,
            numFollowing: 91,
            isViewerFollowing: true
        ),
    ]
}
