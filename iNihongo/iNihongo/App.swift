//
//  ContentView.swift
//  iNihongo
//
//  Created by development on 1/24/25.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            Translator().tabItem {
                Image(systemName: "translate")
                Text("Translator")
            }
            
            VStack {
                Text("Hi")
            }.tabItem {
                Image(systemName: "figure.gymnastics")
                Text("Practice")
            }
            
            VStack {
                Text("Hi")
            }.tabItem {
                Image(systemName: "character.book.closed")
                Text("Vocab")
            }
        }
    }
}

#Preview {
    AppView()
}
