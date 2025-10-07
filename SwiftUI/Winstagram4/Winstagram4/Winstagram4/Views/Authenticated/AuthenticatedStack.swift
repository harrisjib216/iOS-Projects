//
//  AuthenticatedStack.swift
//  Winstagram4
//
//  Created by jibril harris on 7/11/25.
//

import SwiftUI

struct AuthenticatedStack: View {
    @StateObject private var navigator = Navigator()
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            TabView {
                Tab("Home", systemImage: "house") {
                    FeedView(
                        navigator: navigator
                    )
                }
                
                Tab("Create", systemImage: "plus.app") {
                    CreatePostView()
                }
                
                Tab("Me", systemImage: "person") {
                    ProfileView(navigator: navigator, user: User.samples.first!)
                }
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(navigator: navigator, user: user)
            }
        }
    }
}

#Preview {
    AuthenticatedStack()
}
