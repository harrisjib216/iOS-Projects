//
//  ContentView.swift
//  Spot
//
//  Created by development on 3/7/25.
//

import SwiftUI
import SwiftData

struct FeedScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var posts: [Post]

    var body: some View {
        List {
            ForEach(posts) { post in
                PostComponent(post: post)
            }
        }
    }

    private func fetchItems() {
//        withAnimation {
//            let newItem = Post(timestamp: Date())
//            modelContext.insert(newItem)
//        }
    }
}

#Preview {
    FeedScreen()
//        .modelContainer(for: Item.self, inMemory: true)
}
