//
//  ContentView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI

struct Ex1: View {
    let users = ["Abe", "Jibril", "Matt"]
    
    // one user
//    @State private var selection: String?
//    var body: some View {
//        VStack {
//            List(users, id: \.self, selection: $selection) { user in
//                Text(user)
//            }
//            
//            // one item
//            if let selection {
//                Text("Selected user: \(selection)")
//            }
//        }
//    }
        
    // multi
    @State private var selection = Set<String>()
    var body: some View {
        VStack {
            List(users, id: \.self, selection: $selection) { user in
                Text(user)
            }

            if !selection.isEmpty {
                Text("selected user: \(selection.formatted())")
            }
            
            EditButton()
        }
    }
}

#Preview {
    Ex1()
}
