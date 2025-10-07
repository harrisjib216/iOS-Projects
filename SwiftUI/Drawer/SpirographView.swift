//
//  SpirographView.swift
//  Drawer
//
//  Created by jibril harris on 7/10/25.
//

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amountToDraw: Double
    
    func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = greatestCommonDivisor(innerRadius, outerRadius)
        
        let innerRadius = Double(self.innerRadius)
        let outerRadius = Double(self.outerRadius)
        
        let distance = Double(self.distance)
        
        let diff = innerRadius - outerRadius
        
        let endpoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amountToDraw
        
        var path = Path()
        
        for theta in stride(from: 0, through: endpoint, by: 0.01) {
            var x = diff * cos(theta) + distance * cos(diff / outerRadius * theta)
            var y = diff * sin(theta) - distance * sin(diff / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.width / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}

struct SpirographView: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount = 1.0
    @State private var hue = 0.5
    
    var body: some View {
        VStack {
            Spacer()
            
            Spirograph(
                innerRadius: Int(innerRadius),
                outerRadius: Int(outerRadius),
                distance: Int(distance),
                amountToDraw: amount
            )
            .stroke(
                Color(hue: hue, saturation: 1, brightness: 1),
                lineWidth: 1
            )
            .frame(width: 300, height: 300)
            
            Spacer()
            
            Group {
                Text("Inner radius: \(innerRadius.formatted())")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                
                Text("Outer radius: \(outerRadius.formatted())")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                
                Text("Distance: \(distance.formatted())")
                Slider(value: $distance, in: 1...150, step: 1)
                
                Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
                Slider(value: $amount)
                
                Text("Hue: \(hue.formatted())")
                Slider(value: $hue)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SpirographView()
}
