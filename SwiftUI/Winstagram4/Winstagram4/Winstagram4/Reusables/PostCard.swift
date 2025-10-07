//
//  PostCard.swift
//  Winstagram4
//
//  Created by jibril harris on 7/14/25.
//

import SwiftUI

struct PostCard: View {
    @State private var animateHeart = false
    @State private var showComments = false

    @ObservedObject var navigator: Navigator
    @ObservedObject var postsViewModel: PostsViewModel
    var post: Post
    
    var body: some View {        
        VStack {
            ZStack(alignment: .topLeading) {
                // carousel
                ImageCarousel(imageUrls: post.images)
                
                // number of images
                ImageCounter(count: post.images.count)
                
                // heart animation
                HeartAnimation(animateHeart: $animateHeart)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                HStack(spacing: 16) {
                    // number of likes + like action
                    Label(
                        post.likes.formatted(),
                        systemImage: post.isLikedByUser ? "hand.thumbsup.fill" : "hand.thumbsup"
                    )
                    .foregroundStyle(post.isLikedByUser ? .red : .gray)
                    .onTapGesture {
                        toggleLike()
                    }
                    
                    // button to open comments sheet
                    Label(
                        post.comments.count.formatted(),
                        systemImage: "message"
                    )
                    .onTapGesture {
                        openComments()
                    }
                    
                    // button to share the post thumbnail
                    Spacer()
                    ShareButton(toShare: [post.images.first!, "Check this out!"])
                }
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    // username
                    Text(post.author.username)
                        .font(.headline)
                        .foregroundStyle(.gray.opacity(0.7))
                        .onTapGesture {
                            openAuthorProfile()
                        }
                    
                    // caption
                    Text(post.caption)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
            }
            .padding(.horizontal)
        }
        .onTapGesture(count: 2) {
            animateHeartOnDoubleTap()
        }
        .sheet(isPresented: $showComments) {
            CommentsSheet(comments: post.comments) { comment in
                postsViewModel.addComment(for: post, comment: comment)
            } openProfile: { commentAuthor in
                openProfileFromComments(commentAuthor: commentAuthor)
            }
        }
    }
    
    func toggleLike() {
        withAnimation(.linear(duration: 0.15)) {
            postsViewModel.toggleLike(for: post)
        }
    }
    
    func animateHeartOnDoubleTap() {
        postsViewModel.like(post)
        
        withAnimation(.linear(duration: 0.3)) {
            animateHeart.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation(.linear(duration: 0.3)) {
                animateHeart.toggle()
            }
        }
    }
    
    func openComments() {
        showComments = true
    }
        
    func openAuthorProfile() {
        navigator.openProfile(user: post.author)
    }
        
    func openProfileFromComments(commentAuthor: User) {
        showComments = false
        navigator.openProfile(user: commentAuthor)
    }
}

#Preview {
    AuthenticatedStack()
}
