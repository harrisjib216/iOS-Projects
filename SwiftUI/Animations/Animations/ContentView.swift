//
//  ContentView.swift
//  Animations
//
//  Created by development on 3/12/25.
//

import SwiftUI

struct CornerRotateModifer: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifer(
                amount: -90,
                anchor: .topLeading
            ),
            identity: CornerRotateModifer(
                amount: 0,
                anchor: .topLeading
            )
        )
    }
}

struct ContentView: View {
    // buttons
//    @State private var animationAmount = 1.0
    
    // button
//    @State private var animationAmount2 = 0.0
    
    // card
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    
    // snake letters
//    let letters = Array("hello swiftui")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    
    // toggle view appearance
//    @State private var isShowingRed = false
    
        @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        
//         toggle view appearance
//        VStack {
//            Button("tap me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//            
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        
        
//        snake letters
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { idx in
//                Text(String(letters[idx]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(
//                        .linear.delay(Double(idx) / 20.0),
//                        value: dragAmount
//                    )
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//        }
        
        
//        drag and drop card
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.bouncy) {
//                            dragAmount = CGSize.zero
//                        }
////                        dragAmount = CGSize.zero // implicit
//                    }
//            )
////            .animation(.bouncy, value: dragAmount) // implicit
        
        
//        springy of the animation below
//        Button("tap me") {
//            enabled.toggle()
//        }
//        .foregroundStyle(.white)
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .animation(.default, value: enabled)
//        .clipShape(.rect(cornerRadius: enabled ? 60.0 : 0.0))
//        .animation(.spring(duration: 1, bounce: 0.7), value: enabled)
        

//        animate red square btn to blue rounded btn
//        Button("tap me") {
//            enabled.toggle()
//        }
//        .foregroundStyle(.white)
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .clipShape(.rect(cornerRadius: enabled ? 60.0 : 0.0)) // smooth
//        .animation(.default, value: enabled)
////        .clipShape(.rect(cornerSize: enabled ? 60 : 0)) // jumpy because only animations before the animation modifier get modified
        
        
//         imagine a coin flip, this code does that
//        Button("tap me") {
//            withAnimation {
//                animationAmount2 += 360
//            }
//        }
//        .padding(40)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(
//            .degrees(animationAmount2), axis: (x: 0, y: 0, z: 1)
//        )

        
//        increase button size based on stepper amount
//        VStack {
//            Stepper("scale amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            
//            Spacer()
//            
//            Button("tap me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//            
//        }
        

//          animates the size of the button
//        Button("button") {
//            //animationAmount += 1
//        }
//            .padding(50)
//            .foregroundStyle(.white)
//            .background(.red)
//            .clipShape(.circle)
//            //.scaleEffect(animationAmount)
//            //.blur(radius: (animationAmount - 1) * 3)
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeOut(
//                            duration: 1.0
//                        )
//                        .repeatForever(autoreverses: false),
//                        value: animationAmount
//                    )
//            )
//            .onAppear {
//                animationAmount = 2.0
//            }
//            //.animation(.spring(duration: 1.0, bounce: 0.9), value: animationAmount)
    }
}

#Preview {
    ContentView()
}
