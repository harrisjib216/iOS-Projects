//
//  ContentView.swift
//  Cache Image
//
//  Created by jibril harris on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // scale
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 7)
            
            // custom
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                // Color.red
                ProgressView()
            }
            .frame(width: 150, height: 150)
            
            // custom
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("Image could not load")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 150, height: 150)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
