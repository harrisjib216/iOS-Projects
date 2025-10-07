//
//  Blurs.swift
//  Drawer
//
//  Created by jibril harris on 7/10/25.
//

import SwiftUI

struct ColorMultiply: View {
    var body: some View {
        ZStack {
            Image(.phone)
                .resizable()
                .colorMultiply(.blue)
            
//            Rectangle()
//                .fill(.blue)
//                .blendMode(.multiply)
        }
    }
}

struct OverlapAdaptive: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                // swiftui doesn't give an exact red, green, or blue
                // because it checks the background of the screen
                // and adapts the color
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
            
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct OverlapExact: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                // these are exact rgb values
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
            
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}


struct Blurs: View {
    var body: some View {
        VStack {
//            ColorMultiply()
            
            OverlapAdaptive()
            OverlapExact()
        }
    }
}


#Preview {
    Blurs()
}
