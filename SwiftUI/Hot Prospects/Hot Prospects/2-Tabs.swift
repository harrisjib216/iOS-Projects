//
//  ContentView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI

struct Ex2: View {
    @State private var selectedTab = "one"
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("show tab two") {
                selectedTab = "two"
            }
            .tabItem {
                Label("one", systemImage: "square")
            }
            .tag("one")
            
            Button("show tab one") {
                selectedTab = "one"
            }
            .tabItem {
                Label("two", systemImage: "circle")
            }
            .tag("two")
        }
    }
}

#Preview {
    Ex2()
}
