//
//  ContentView.swift
//  Moonshot
//
//  Created by jibril harris on 4/8/25.
//

import SwiftUI

struct Item: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        self.text = text
        print(text)
    }
}

struct SampleView: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    // infinite scroll
    func scroller() -> some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(1..<1000) {
                    Item(text: "Item \($0)")
                }
            }
        }
    }
    
    // dumps everything
    func lister() -> some View {
        List {
            LazyVGrid(columns: layout) {
                ForEach(1..<1000) {
                    Item(text: "Item \($0)")
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Testing")
         
            // all at once
//             scroller()
            
            // all at once
//             lister()
        }
    }
}

#Preview {
    SampleView()
}
