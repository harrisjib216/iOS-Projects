//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by jibril harris on 6/24/25.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("top")
            
            InnerView()
                .background(.green)
            
            Text("bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("left")
            
            GeometryReader { proxy in
                Text("center")
                    .background(.blue)
                    .onTapGesture {
                        
                        print("global center: \(proxy.frame(in: .global).midX), \(proxy.frame(in: .global).midY)")
                        
                        print("local center: \(proxy.frame(in: .local).midX), \(proxy.frame(in: .local).midY)")
                        
                        print("custom center: \(proxy.frame(in: .named("custom")).midX), \(proxy.frame(in: .named("custom")).midY)")
                        
                    }
            }
            .background(.orange)
            
            Text("right")
        }
    }
}

struct ContentView: View {
    var body: some View {
//        Text("test")
//            .background(.blue)
//            .position(x: 100, y: 100)
//            .background(.purple)
        OuterView()
            .background(.red)
            .coordinateSpace(name: "custom")
    }
}

#Preview {
    ContentView()
}
