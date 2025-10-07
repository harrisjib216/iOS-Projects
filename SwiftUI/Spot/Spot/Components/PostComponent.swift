//
//  ContentView.swift
//  Spot
//
//  Created by development on 3/7/25.
//

import SwiftUI
import SwiftData

struct PostComponent: View {
    var post: Post

    var body: some View {
        ZStack {
            VStack {
                
            }
            
            GeometryReader { geometry in
            
                
                AsyncImage(url: URL(string: post.imageUrl)) { phase in
                    switch (phase) {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    default:
                        Text("Could not load image")
                    }
                }
            }
        }
        Text("todo")
    }
}

#Preview {
    let user = User(id: "1", firstName: "Jibril", lastName: "Harris")
    let post = Post(timestamp: Date(), caption: "Hey there!", author: user, imageUrl: "https://images.pexels.com/photos/7142962/pexels-photo-7142962.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
    
    PostComponent(post: post)
    
//        .modelContainer(for: Item.self, inMemory: true)
}
