//
//  TransformingShapes.swift
//  Drawer
//
//  Created by jibril harris on 7/9/25.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for num in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: num)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct TransformingFlowerView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.red, lineWidth: 1)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset: \(petalOffset.formatted())")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width: \(petalWidth.formatted())")
            Slider(value: $petalWidth, in: 0...100)
                .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    TransformingFlowerView()
}
