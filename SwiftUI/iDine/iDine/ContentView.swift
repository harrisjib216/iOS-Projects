//
//  ContentView.swift
//  iDine
//
//  Created by jibril harris on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
        }
    }
}

#Preview {
    ContentView()
}
