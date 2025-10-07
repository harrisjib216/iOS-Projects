//
//  ContentView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI

struct SwipeActions: View {
    
    var body: some View {
        List {
            Text("ji")
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("pinned")
                    }
                    .tint(.orange)
                }
                .swipeActions {
                    Button("Send message", systemImage: "message") {
                        print("hi")
                    }

                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("delete")
                    }
                }
            
        }
    }
}

#Preview {
    SwipeActions()
}
