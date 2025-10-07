//
//  HeartAnimation.swift
//  Winstagram4
//
//  Created by jibril harris on 7/25/25.
//

import SwiftUI

struct HeartAnimation: View {
    @Binding var animateHeart: Bool

    var body: some View {
        Image(systemName: "heart.fill")
            .foregroundStyle(.red)
            .scaleEffect(animateHeart ? 4.0 : 1.0)
            .opacity(animateHeart ? 1.0 : 0.0)
            .animation(.linear(duration: 0.25), value: animateHeart)
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.width)
    }
}

#Preview {
    @Previewable @State var animateHeart = false
    
    ZStack {
        Color
            .gray.opacity(0.2)
        
        Text("Double tap me")

        HeartAnimation(animateHeart: $animateHeart)
    }
    .onTapGesture(count: 2) {
        withAnimation(.linear(duration: 0.3)) {
            animateHeart.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation(.linear(duration: 0.3)) {
                animateHeart.toggle()
            }
        }
    }
}
