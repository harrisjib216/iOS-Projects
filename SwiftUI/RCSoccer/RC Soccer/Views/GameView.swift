//
//  GameView.swift
//  RC Soccer
//
//  Created by jibril harris on 11/18/25.
//

import SwiftUI
import RealityKit

struct GameView: View {
    @State var keysPressed = Set<KeyEquivalent>()
    @State var ballIsInGoal = false
    @State var player1Score = 0
    @State var player2Score = 0
    
    private let keyboardControls: Set<KeyEquivalent> = [
        .init("w"),
        .init("a"),
        .init("s"),
        .init("d"),
        
        .leftArrow,
        .upArrow,
        .rightArrow,
        .downArrow
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Player 1 camera
                RealityView { content in
                    createGameScene(content)
                    
                    createPlayer1(content, makeCamera: true)
                    createPlayer2(content)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Player 2 camera
                RealityView { content in
                    createGameScene(content)

                    createPlayer1(content)
                    createPlayer2(content, makeCamera: true)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .focusable()
            .onKeyPress(keys: keyboardControls) { keyPress in
                keysPressed.insert(keyPress.key)
                return .handled
            }
            .onKeyPress(keys: keyboardControls, phases: .up) { keyPress in
                keysPressed.remove(keyPress.key)
                return .handled
            }
            
            HStack {
                ScoreLabel(score: player1Score)
                
                Spacer()
                
                ScoreLabel(score: player2Score)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
        }
    }
    
    func createGameScene(_ content: any RealityViewContentProtocol) {
        createStadium(content)
        createBall(content)
    }
}

#Preview {
    GameView()
}
