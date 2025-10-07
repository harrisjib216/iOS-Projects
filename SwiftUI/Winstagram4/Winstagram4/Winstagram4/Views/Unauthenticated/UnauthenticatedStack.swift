//
//  UnauthenticatedStack.swift
//  Winstagram4
//
//  Created by jibril harris on 7/11/25.
//

import SwiftUI

struct UnauthenticatedStack: View {
    @StateObject private var navigator = Navigator()
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            
        }
    }
}

#Preview {
    UnauthenticatedStack()
}
