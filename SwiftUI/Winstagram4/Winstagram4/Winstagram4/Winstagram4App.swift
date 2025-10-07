//
//  Winstagram4App.swift
//  Winstagram4
//
//  Created by jibril harris on 7/11/25.
//

import SwiftUI

@main
struct Winstagram4App: App {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.loading {
                ProgressView()
            } else if authViewModel.loading {
                UnauthenticatedStack()
                    .environmentObject(authViewModel)
            } else {
                AuthenticatedStack()
                    .environmentObject(authViewModel)
            }
        }
    }
}
