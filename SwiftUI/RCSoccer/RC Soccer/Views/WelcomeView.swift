//
//  WelcomeView.swift
//  RC Soccer
//
//  Created by jibril harris on 11/17/25.
//

import SwiftUI

struct WelcomeView: View {
    var startGame: () -> Void
    
    var body: some View {
        ZStack {
            // todo: replace with an image
            Color.blue.opacity(0.7)
            
            VStack {
                Text("RC Soccer")
                    .font(.custom("system", size: 48))
                    .fontWeight(.bold)
                
                Text("Developed by Jibril Harris")
                    .font(.custom("system", size: 20))
                    .padding(.top, 2)
                
                Button("Start game") {
                    startGame()
                }
                .padding(.top, 16)
            }
        }
        .background(Color.gray)
    }
}

#Preview {
    WelcomeView {
        print("clicked")
    }
}
