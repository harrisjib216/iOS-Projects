//
//  ComplexShapeAnimations.swift
//  Drawer
//
//  Created by jibril harris on 7/10/25.
//

import SwiftUI

struct CheckerBoard: Shape {
    var rows: Int
    var cols: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(cols))
        }
        
        set {
            rows = Int(newValue.first)
            cols = Int(newValue.second)
        }
    }
    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let colSize = rect.width / Double(cols)
        
        for row in 0..<rows {
            for col in 0..<cols {
                if (row + col).isMultiple(of: 2) {
                    let startX = colSize * Double(col)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: colSize, height: rowSize)
                    
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct ComplexShapeAnimations: View {
    @State private var rows = 4
    @State private var cols = 4
    
    
    var body: some View {
        VStack {
            CheckerBoard(rows: rows, cols: cols)
                .onTapGesture {
                    withAnimation(.linear(duration: 3)) {
                        rows *= 2
                        cols *= 4
                    }
                }
        }
    }
}

#Preview {
    ComplexShapeAnimations()
}
