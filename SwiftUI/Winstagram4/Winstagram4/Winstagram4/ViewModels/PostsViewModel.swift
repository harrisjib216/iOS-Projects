//
//  PostsViewModel.swift
//  Winstagram4
//
//  Created by jibril harris on 7/15/25.
//

import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var loading = false
    @Published var posts = [Post]()
    
    func fetchPosts(id userId: UUID? = nil) async {
        loading = true
        
        if let userId {
            self.posts = Post.samples.filter { post in
                post.author.id == userId
            }
        } else {
            self.posts = Post.samples
        }
        
        loading = false
    }

    func like(_ post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            if !posts[index].isLikedByUser {
                posts[index].likes += 1
                posts[index].isLikedByUser = true
            }
        }
    }
    
    func toggleLike(for post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].likes += posts[index].isLikedByUser ? -1 : 1
            posts[index].isLikedByUser.toggle()
        }
    }
    
    func addComment(for post: Post, comment: String) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].comments.append(
                PostComment(
                    id: UUID(),
                    author: User.samples.first!, // todo: fix author issues
                    content: comment,
                    timestamp: .now
                )
            )
        }
    }
}
