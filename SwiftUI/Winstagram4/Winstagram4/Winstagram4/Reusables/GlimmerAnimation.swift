//
//  ShimmerView.swift
//  Winstagram4
//
//  Created by jibril harris on 7/16/25.
//

import SwiftUI

struct GlimmerAnimation: View {
    @State private var opacity = 0.2
    
    var systemImage = "photo"
    var systemImageSize: CGFloat = 64
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(.gray)
                .opacity(opacity)
                .animation(.linear(duration: 1.2).delay(0.4).repeatForever(autoreverses: true), value: opacity)
                .onAppear {
                    opacity = 0.7
                }
            
            Image(systemName: systemImage)
                .font(.system(size: systemImageSize))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    GlimmerAnimation()
}
