//
//  ProfileViewModel.swift
//  Winstagram4
//
//  Created by jibril harris on 7/24/25.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var loading = true

    @Published var profile: UserProfile?
    
    @Published var postViewModel = PostsViewModel()
    
    func fetchProfile(id userId: UUID) async {
        loading = true
        
        // todo: make concurrent/parallel
        
        // todo: use network
        let userProfile = UserProfile.samples.first { item in
            item.id == userId
        }
        
        if userProfile != nil {
            profile = userProfile
        }
        
        // todo: use network
        await postViewModel.fetchPosts(id: userId)
        
        loading = false
    }
}
