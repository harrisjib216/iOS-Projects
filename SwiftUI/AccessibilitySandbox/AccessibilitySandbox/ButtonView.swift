//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by jibril harris on 6/17/25.
//

import SwiftUI

struct ButtonView: View {
    let images = [
        "pic1",
        "pic2",
        "pic3",
        "pic4"
    ]
    
    let labels = [
        "Get more rest",
        "Mountain range",
        "French bulldog",
        "Crab",
    ]
    
    @State private var selectedIndex = Int.random(in: 0...3)
    
    var body: some View {
        VStack {
            // preferred ✅
            Button {
                selectedIndex = Int.random(in: 0...3)
            } label: {
                Image(images[selectedIndex])
                    .resizable()
                    .scaledToFit()
            }
            .accessibilityLabel(labels[selectedIndex])
            
            // not preferred ❎
            Image(images[selectedIndex])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectedIndex = Int.random(in: 0...3)
                }
                .accessibilityLabel(labels[selectedIndex])
                .accessibilityAddTraits(.isButton)
        }
        .padding()
    }
}

#Preview {
    ButtonView()
}
