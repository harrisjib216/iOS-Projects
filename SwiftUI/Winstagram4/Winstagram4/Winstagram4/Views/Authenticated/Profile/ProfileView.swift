//
//  ProfileView.swift
//  Winstagram4
//
//  Created by jibril harris on 7/16/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var profileViewModel = ProfileViewModel()
    private let avatarSize: CGFloat = 80
    
    @ObservedObject var navigator: Navigator
    var user: User
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                // profile avatar
                ProfileImage(
                    profileImgUrl: user.profileImg,
                    size: avatarSize
                )
                
                // user name
                Text("@\(user.username)")
                    .font(.headline)
                    .foregroundColor(.primary)
                

                if let profile = profileViewModel.profile {
                    // bio
                    Text(profile.bio)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(.horizontal, 16)

                    HStack {
                        // num followers
                        Spacer()
                        VStack {
                            Text(profile.numFollowers.formatted())
                            Text("followers")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        // num following
                        VStack {
                            Text(profile.numFollowers.formatted())
                            Text("following")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        
                        // num posts
                        Spacer()
                        VStack {
                            Text(profile.numPosts.formatted())
                            Text("posts")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
            }
            
            // posts
            PostsList(
                navigator: navigator,
                postsViewModel: profileViewModel.postViewModel
            )
        }
        .onAppear {
            Task {
                await profileViewModel.fetchProfile(id: user.id)
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var navigator = Navigator()
    
    NavigationStack {
        ProfileView(
            navigator: navigator,
            user: User.samples.first!
        )
    }
}
