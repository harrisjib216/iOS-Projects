//
//  FeedView.swift
//  Winstagram4
//
//  Created by jibril harris on 7/14/25.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var postsViewModel = PostsViewModel()
    
    @ObservedObject var navigator: Navigator

    var body: some View {
        VStack {
            if postsViewModel.loading {
                ProgressView()
            } else {
                PostsList(
                    navigator: navigator,
                    postsViewModel: postsViewModel,
                    navigationTitle: "Feed"
                )
            }
        }
        .onAppear {
            Task {
                await postsViewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    AuthenticatedStack()
}
