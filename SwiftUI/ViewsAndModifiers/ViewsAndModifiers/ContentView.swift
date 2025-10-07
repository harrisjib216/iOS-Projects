//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by development on 3/10/25.
//

import SwiftUI

struct CustomModfier: ViewModifier {
//     these can have their own variables
    var x = 1
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.red)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
//     Err: Extensions must not contain stored properties
//    var x = 1
    
    func secondModifier() -> some View {
        modifier(CustomModfier())
    }
}

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let cols: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<cols, id: \.self) { col in
                        content(row, col)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    // explicit property
    let hello = Text("hello")
    
    // computed property
    var world: some View {
        Text("world")
    }
    
    // returning multiple things
    var ex1: some View {
        Group {
            Text("top")
            Text("bottom")
        }
    }
    
    // this mimic the body property
    @ViewBuilder var ex2: some View {
        Text("one")
        Text("two")
    }
    
    
    // some view: opaque return types
    // conforms to the view protocol but we don't know which one
    
    // benefits
    // swiftui compiler looks at layout and how it changes in the future
    
    var body: some View {
        GridStack(rows: 4, cols: 4) { r, c in
            Text("  \(r),\(c)  |")
        }
        
        Text("custom modifier")
            .modifier(CustomModfier())
        
        Text("custom modifier")
            .secondModifier()
        
        // swift ui renders your view after every modifier
        // modifiers return the same struct + the new modifications
        // so you have to chain your changes
        Button("Click me") {
            print(type(of: self.body))
        }
        .background(.red)
        .frame(width: 200, height: 200)
        .background(.green)
        
        Text("fire")
        .background(.red) // color the space
        .padding() // add padding
        .background(.orange) // color the space
        .padding() // add padding
        .background(.yellow) // color the space
        
        // conditional
        // not great, creates two views and destroys one of them
        // less performant
        if true == true {
            Text("True")
        } else {
            Text("False")
        }
        
        // better
        Text(true ? "true" : "false")
        
        
        // environment modifier
        // better than multiple direct modifiers
        VStack {
            Text("one")
            Text("two")
            Text("three")
                .font(.headline)
        }
        // doesn't always work
        .font(.largeTitle)
        
        
        // capsule
        CapsuleText(text: "a")
        CapsuleText(text: "b")
    }
    
    // swift ui knows
    // 1 what this is (its type)
    // 2 modifications applied to it
    // and it expects Text as its outter most value
    var _example_text: Text {
        Text("message")
    }
    
    // same here, except this doesn't work
    // because button conforms to View but
    // it isn't a view
    // var _example_view: View {
    //    Button("") {
    //    }
    // }
    
    // this is compiler stuff to figure out
    // this lets us not focus on long type matching
    
    // swift ui silenty creates a tuple view
    // that contains the types we need
//    var _stacked: VStack<Text> {
//        VStack {
//            Text("")
//            Text("")
//        }
//    }

}

#Preview {
    ContentView()
}
