//
//  Player1.swift
//  RC Soccer
//
//  Created by jibril harris on 11/18/25.
//

import SwiftUI
import RealityKit

extension GameView {
    func createPlayer1(_ content: any RealityViewContentProtocol, makeCamera: Bool = false) {
        // create skin, size, and initial position for player
        let size: SIMD3<Float> = [0.2, 0.2, 0.2]
        let initialPosition = SIMD3<Float>(x: -1.0, y: 0.2, z: 0.0)
        
        let playerModel = ModelComponent(
            mesh: .generateBox(size: size),
            materials: [SimpleMaterial(color: .red, isMetallic: false)]
        )
        
        // create collision and physics components to push the ball around
        let playerCollision = CollisionComponent(shapes: [
            .generateBox(size: size)
        ])
        
        var playerPhysics = PhysicsBodyComponent()
        playerPhysics.mode = .kinematic
        playerPhysics.massProperties = .init(mass: 2.0)

        // create player
        let player1 = Entity()
        player1.name = "player1"
        player1.components.set([
            playerModel,
            playerCollision,
            playerPhysics
        ])
        
        player1.position = initialPosition
        
        // listen for frame updates to move the player around
        _ = content.subscribe(to: SceneEvents.Update.self) { _ in
            var dx: Float = player1.position.x + 0.0
            var dz: Float = player1.position.z + 0.0
            
            if keysPressed.contains(.init("a")) { dz -= 0.02 }
            if keysPressed.contains(.init("w")) { dx += 0.02 }
            if keysPressed.contains(.init("d")) { dz += 0.02 }
            if keysPressed.contains(.init("s")) { dx -= 0.02 }
            
            player1.setPosition(
                SIMD3<Float>(
                    x: dx,
                    y: player1.position.y,
                    z: dz
                ),
                relativeTo: nil
            )
        }
        
        if makeCamera {
            createPlayer1Camera(content, player: player1)
        }
        
        // add player
        content.add(player1)
    }
    
    func createPlayer1Camera(_ content: any RealityViewContentProtocol, player: Entity) {
        // create camera
        let camera = Entity()
        camera.components.set(PerspectiveCameraComponent())

        // set initial and tracking position
        let cameraLocation: SIMD3<Float> = [-4, 5, 0]
        camera.look(at: player.position, from: cameraLocation, relativeTo: nil)

        // define field bounds
        let fieldWidth: Float = 15
        let fieldDepth: Float = 12

        _ = content.subscribe(to: SceneEvents.Update.self) { _ in
            var dx = player.position.x - 4  // offset behind the player
            var dz = player.position.z

            // clamp to field boundaries
            dx = max(-fieldWidth / 2 + 1, min(dx, fieldWidth / 2 - 1))
            dz = max(-fieldDepth / 2 + 1, min(dz, fieldDepth / 2 - 1))

            camera.setPosition([dx, cameraLocation.y, dz], relativeTo: nil)
            camera.look(at: player.position, from: camera.position, relativeTo: nil)
        }

        content.add(camera)
    }
}
