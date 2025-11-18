//
//  ScoreLabel.swift
//  RC Soccer
//
//  Created by jibril harris on 11/18/25.
//

import SwiftUI

struct ScoreLabel: View {
    var score: Int
    
    var body: some View {
        Text(score.formatted())
            .font(.system(size: 36, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 3)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

#Preview {
    ScoreLabel(score: 5)
}
