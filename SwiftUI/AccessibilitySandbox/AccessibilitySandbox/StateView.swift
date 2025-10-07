//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by jibril harris on 6/17/25.
//

import SwiftUI

struct SwipeAdjustableActionView: View {
    @State private var score = 10.0
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
            
            Button("Increment") {
                score *= 3.78
            }
            
            Button("Decrement") {
                score /= 1.947
            }
        }
        .padding()
        .accessibilityElement()
        .accessibilityLabel("Score")
        .accessibilityValue("Score equals \(score)")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                score *= 3.78
            case .decrement:
                score /= 1.947
            @unknown default:
                print("Not handled")
            }
        }
    }
}

#Preview {
    SwipeAdjustableActionView()
}
