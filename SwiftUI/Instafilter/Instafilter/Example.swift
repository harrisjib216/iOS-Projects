//
//  Example.swift
//  Instafilter
//
//  Created by jibril harris on 6/6/25.
//

import SwiftUI

struct Example: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor: Color = .white
    
    // the state property wrapper is a struct that wraps
    // var blur = 0.0
    @State private var blur = 0.0
//    {
//        didSet {
//            print("new value set, \(self)")
//        }
//    }
    
    var body: some View {
        VStack {
            Text("Hello, world")
                .blur(radius: blur)
            
            // this changes the internally store value for blur
            // blur is saved in memory somewhere
            Slider(value: $blur, in: 0...20)
            
            
            Button("Random blue") {
                // this goes through the non-mutating setter
                // and "replaces" the value?
                blur = Double.random(in: 0...20)
            }
            
            
            Button("show modal") {
                showingConfirmation.toggle()
            }
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Yellow") { backgroundColor = .yellow }
                Button("Green") { backgroundColor = .green }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
        }
        .onChange(of: blur) { oldValue, newValue in
            print("changing \(oldValue), \(newValue)")
        }
    }
}

#Preview {
    Example()
}
