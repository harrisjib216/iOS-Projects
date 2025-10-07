//
//  Navigation.swift
//  Winstagram4
//
//  Created by jibril harris on 7/25/25.
//

import Foundation
import SwiftUI

class Navigator: ObservableObject {
    @Published var path = NavigationPath()
    
    func openProfile(user: User) {
        path.append(user)
    }
}
