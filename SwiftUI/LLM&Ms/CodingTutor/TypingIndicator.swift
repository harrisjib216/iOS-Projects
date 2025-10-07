//
//  TypingIndicator.swift
//  CodingTutor
//
//  Created by jibril harris on 7/8/25.
//

import SwiftUI

struct TypingIndicator: View {
    @State private var animating = false
    var body: some View {
        Image(systemName: "ellipsis")
            .symbolEffect(.variableColor, isActive: animating)
            .font(.title)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.gray.opacity(0.2))
            .clipShape(.rect(cornerRadius: 16))
            .onAppear {
                withAnimation(.linear.repeatForever()) {
                    animating = true
                }
            }
    }
}

#Preview {
    TypingIndicator()
}
