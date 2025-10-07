//
//  CommentsSheet.swift
//  Winstagram4
//
//  Created by jibril harris on 7/14/25.
//

import SwiftUI

struct CommentsSheet: View {
    @State private var newComment = ""
    
    var comments: [PostComment]
    var addComment: (String) -> Void
    var openProfile: (User) -> Void

    var body: some View {
        VStack {
            // comments
            List {
                ForEach(comments) { comment in
                    VStack(alignment: .leading) {
                        // timestamp
                        Text(comment.timestamp.timeAgo())
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        // author's name
                        Text(comment.author.username)
                            .font(.headline)
                            .foregroundStyle(.gray)
                        
                        // content
                        Text(comment.content)
                            .font(.subheadline)
                    }
                    .onTapGesture {
                        openProfileWrapper(comment.author)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
                
            // add comment field
            TextField(text: $newComment) {
                Label("Add your comment", systemImage: "heart")
            }
            .padding()
            .onSubmit(addCommentWrapper)
        }
        .presentationDetents([.medium, .large])
    }
    
    func clearCommentField() {
        newComment = ""
    }
    
    func addCommentWrapper() {
        addComment(newComment)
        clearCommentField()
    }
    
    func openProfileWrapper(_ user: User) {
        openProfile(user)
    }
}

#Preview {
    AuthenticatedStack()
}
