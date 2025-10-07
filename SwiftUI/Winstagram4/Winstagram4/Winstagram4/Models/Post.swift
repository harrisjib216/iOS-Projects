//
//  Post.swift
//  Winstagram4
//
//  Created by jibril harris on 7/14/25.
//

import Foundation

struct Post: Identifiable {
    var id: UUID
    var author: User
    var images: [URL]
    var caption: String
    var likes: Int
    var comments: [PostComment]
    var isLikedByUser: Bool

    init(id: UUID, author: User, images: [String], caption: String, likes: Int, comments: [PostComment], isLikedByUser: Bool) {
        self.id = id
        self.author = author
        
        self.images = images.map { stringUrl in
            URL(string: stringUrl)!
        }
        
        self.caption = caption
        self.likes = likes
        self.comments = comments
        self.isLikedByUser = isLikedByUser
    }
    
    static let samples = [
        Post(
            id: UUID(),
            author: User.samples.first!,
            images: [
                "https://images.pexels.com/photos/776078/pexels-photo-776078.jpeg",
                "https://images.pexels.com/photos/5830/nature-animal-dog-playing.jpg"
            ],
            caption: "Frenchie and Rocky at the park today!",
            likes: 1,
            comments: [
                PostComment(id: UUID(), author: User.samples.last!, content: "Cool", timestamp: .now)
            ],
            isLikedByUser: true
        ),
        
        Post(
            id: UUID(),
            author: User.samples.last!,
            images: [
                "https://images.pexels.com/photos/3848419/pexels-photo-3848419.jpeg",
            ],
            caption: "Can't get enough of this view!",
            likes: 20,
            comments: [
                PostComment(id: UUID(), author: User.samples.first!, content: "Inredible view of the skyline!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The hustle and bustle of NYC never gets old.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "NYC is always so vibrant and full of life.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Wow, the city looks amazing from up here!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "I can almost hear the subway rumbling!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Times Square looks even better at night!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The best city in the world!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Love how the lights reflect on the buildings.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Central Park looks beautiful in this photo.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Such a great shot of the Brooklyn Bridge!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "This reminds me of my trip last summer!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "I wish I could be there right now!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The Empire State Building never gets old.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "NYC is just magical, especially at sunset.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Nothing like the energy of this city!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "I can’t wait to visit NYC again.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Love the blend of old and new architecture.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The skyscrapers look so majestic.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "This city just has so much character!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Such a classic view of New York!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "I can feel the energy of NYC through this photo.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "That’s a perfect shot of Manhattan!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "So much to do, so little time in NYC!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The street food in NYC is unbeatable.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The diversity in this city is amazing.", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "What a stunning shot of the city!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Definitely adding this to my bucket list!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "New York at night is something else!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "Such a cool perspective of the city!", timestamp: .now),
                PostComment(id: UUID(), author: User.samples.first!, content: "The reflections in the windows are so cool.", timestamp: .now)
            ],
            isLikedByUser: false
        )
    ]
}
