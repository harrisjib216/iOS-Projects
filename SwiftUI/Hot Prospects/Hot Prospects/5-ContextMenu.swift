//
//  ContentView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI

struct ContextMenu: View {
    @State private var background = Color.red
    var body: some View {
        VStack {
            Text("Hello, world")
                .padding()
                .background(background)
            
            Text("Change color")
                .padding()
                .contextMenu {
                    Button("Red", role: .destructive) {
                        background = .red
                    }
                    
                    Button("Blue") {
                        background = .blue
                    }
                    
                    Button("Green") {
                        background = .green
                    }
                    
                    Button("White") {
                        background = .white
                    }
                }
        }
    }
}

#Preview {
    ContextMenu()
}
