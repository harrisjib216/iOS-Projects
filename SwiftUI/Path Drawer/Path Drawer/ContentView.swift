//
//  ContentView.swift
//  Path Drawer
//
//  Created by development on 3/5/25.
//

import SwiftUI

// start at 0,0
// can i go -> left, up, right, or down
// pick random index
// draw a pixel
// pick random location
struct ContentView: View {
    var body: some View {
        Rectangle()
            .stroke(Color.gray, lineWidth: 1.0)
            .padding(EdgeInsets(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0))
//            .contentMargins(
//                EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
//            )
//            .stroke(style: StrokeStyle())
            
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
