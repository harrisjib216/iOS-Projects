//
//  ContentView.swift
//  RC Soccer
//
//  Created by jibril harris on 11/17/25.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @State private var playing = false
    
    var body: some View {
        ZStack {
            GameView()
            
            if !playing {
                WelcomeView {
                    startGame()
                }
            }
        }
    }
    
    func startGame() {
        playing.toggle()
    }
}

#Preview {
    ContentView()
}
