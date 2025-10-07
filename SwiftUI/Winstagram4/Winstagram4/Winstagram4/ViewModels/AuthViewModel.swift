//
//  AuthViewModel.swift
//  Winstagram4
//
//  Created by jibril harris on 7/26/25.
//

import SwiftUI

enum AppState {
    case loading
    case authenticated
    case unauthenticated
}

class AppViewModel: ObservableObject {
    @Published private var _appUser: User?
    @Published var appState: AppState = .loading

    var appUser: User {
        _appUser!
    }
    
    init() {
        if true {
            appState = .authenticated
            _appUser = User.samples.first!
        } else {
            appState = .unauthenticated
        }
        
    }
    
    func login() {
        
    }
    
    func logout() {
        
    }
}
