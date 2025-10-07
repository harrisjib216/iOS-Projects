//
//  PostsList.swift
//  Winstagram4
//
//  Created by jibril harris on 7/24/25.
//

import SwiftUI

struct PostsList: View {
    @ObservedObject var navigator: Navigator
    @ObservedObject var postsViewModel: PostsViewModel
    var navigationTitle = ""
    
    var body: some View {
        if postsViewModel.loading {
            ProgressView()
        } else if postsViewModel.posts.isEmpty {
            ContentUnavailableView("No posts to show", systemImage: "")
        } else {
            List {
                ForEach(postsViewModel.posts) { post in
                    PostCard(
                        navigator: navigator,
                        postsViewModel: postsViewModel,
                        post: post
                    )
                        .listRowSeparator(.hidden)
                        .listRowInsets(
                            EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 40,
                                trailing: 0
                            )
                        )
                    
                }
            }
            .listStyle(.plain)
            .padding(0)
            .navigationTitle(navigationTitle)
        }
    }
}

#Preview {
    AuthenticatedStack()
}
