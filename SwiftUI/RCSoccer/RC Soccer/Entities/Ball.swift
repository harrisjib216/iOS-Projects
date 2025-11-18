//
//  Ball.swift
//  RC Soccer
//
//  Created by jibril harris on 11/18/25.
//

import SwiftUI
import RealityKit

extension GameView {
    func createBall(_ content: any RealityViewContentProtocol) {
        let radius: Float = 0.45
        
        let ballModel = ModelComponent(
            mesh: .generateSphere(radius: radius),
            materials: [SimpleMaterial(color: .orange, isMetallic: false)]
        )
        
        let ballCollision = CollisionComponent(shapes: [
            .generateSphere(radius: radius)
        ])
        
        var ballPhysics = PhysicsBodyComponent()
        ballPhysics.mode = .dynamic
        ballPhysics.massProperties = .init(mass: 1.0)
        
        let ball = Entity()
        ball.name = "ball"
        ball.components.set([
            ballModel,
            ballCollision,
            ballPhysics
        ])
        
        ball.position = SIMD3(x: 0, y: 0.5, z: 0)
        
        _ = content.subscribe(to: CollisionEvents.Began.self) { event in
            let names = [
                event.entityA.name,
                event.entityB.name
            ]
            
            if names.contains("ball") && names.contains("goalLeft") {
                handleGoal(update: $player1Score, ball: ball)
            }
            
            if names.contains("ball") && names.contains("goalRight") {
                handleGoal(update: $player2Score, ball: ball)
            }
        }
        
        content.add(ball)
    }
    
    // reset the ball with player scores
    @MainActor
    func handleGoal(update score: Binding<Int>, ball: Entity) {
        ball.setPosition([0, 0.5, 0], relativeTo: nil)
        
        if var physics = ball.components[PhysicsBodyComponent.self] {
            physics.mode = .dynamic
            ball.components.set(physics)
        }
        
        score.wrappedValue += 1
    }
}
