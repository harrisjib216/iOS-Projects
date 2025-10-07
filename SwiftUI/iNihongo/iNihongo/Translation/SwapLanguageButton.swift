//
//  SwapButton.swift
//  iNihongo
//
//  Created by development on 1/25/25.
//

import SwiftUI

struct SwapLanguageButton: View {
    let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: 16) {
                Image(systemName: "rectangle.2.swap")
                Text("Swap")
            }
            .padding(8.0)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    SwapLanguageButton {
        print("swap!")
    }
}
