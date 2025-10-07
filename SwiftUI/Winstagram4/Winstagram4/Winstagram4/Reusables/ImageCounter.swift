//
//  ImageCounter.swift
//  Winstagram4
//
//  Created by jibril harris on 7/25/25.
//

import SwiftUI

struct ImageCounter: View {
    var count: Int
    
    var body: some View {
        Label(count.formatted(), systemImage: "camera")
            .font(.callout)
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .foregroundStyle(.white)
            .background(.black)
            .clipShape(.rect(cornerRadius: 8))
            .offset(x: 4, y: 8)
    }
}

#Preview {
    ImageCounter(count: 4)
}
