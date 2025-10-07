//
//  AnimatingShapes.swift
//  Drawer
//
//  Created by jibril harris on 7/10/25.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Trapezoid2: Shape {
    var insetAmount: Double
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatingShapes: View {
    @State private var insetAmount = 50.0
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                
                // this doesnt animated because the insetAmount is being
                // passed in immediately in each render, and doesn't iterate
                // or pass in a range per say
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
        
        Trapezoid2(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                
                // this doesnt animated because the insetAmount is being
                // passed in immediately in each render, and doesn't iterate
                // or pass in a range per say
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
}

#Preview {
    AnimatingShapes()
}
