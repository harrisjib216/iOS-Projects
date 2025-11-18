//
//  Stadium.swift
//  RC Soccer
//
//  Created by jibril harris on 11/18/25.
//

import SwiftUI
import RealityKit

extension GameView {
    func createStadium(_ content: any RealityViewContentProtocol) {
        let stadium = Entity()
        
        createField(stadium)
        createFieldBoundaries(content)
        createGoals(stadium)
        createSeating(stadium)
        createLighting(stadium, content)
        
        content.add(stadium)
    }
    
    /// MARK: soccer field
    // grass field for the ball to roll on
    private func createField(_ stadium: Entity) {
        // create grass field
        let field = ModelEntity(
            mesh: .generateBox(width: 15, height: 0.1, depth: 12),
            materials: [SimpleMaterial(color: .green, isMetallic: false)]
        )

        // add physics and collision component to let the ball roll
        let fieldCollision = CollisionComponent(
            shapes: [.generateBox(width: 20, height: 0.1, depth: 16)]
        )
        let fieldPhysics = PhysicsBodyComponent(mode: .static)
        
        field.components.set([
            fieldCollision,
            fieldPhysics
        ])

        field.position = [0, 0, 0]
        
        stadium.addChild(field)
        
        // add center circle
        let decorationColor = NSColor.white.withAlphaComponent(0.9)

        let centerCircle = ModelEntity(
            mesh: .generateCylinder(height: 0.12, radius: 1.5),
            materials: [SimpleMaterial(color: decorationColor, isMetallic: false)]
        )
        centerCircle.position = [0, 0.06, 0]
        stadium.addChild(centerCircle)
        
        // add center field dividers
        let centerLine = ModelEntity(
            mesh: .generateBox(width: 0.1, height: 0.12, depth: 8),
            materials: [SimpleMaterial(color: decorationColor, isMetallic: false)]
        )
        centerLine.position = [0, 0.06, 0]
        stadium.addChild(centerLine)
        
        // add penalty boxes
        for side in [-1, 1] {
            let penaltyBox = ModelEntity(
                mesh: .generateBox(width: 3, height: 0.12, depth: 5, cornerRadius: 0.05),
                materials: [SimpleMaterial(color: decorationColor.withAlphaComponent(0.5), isMetallic: false)]
            )
            
            penaltyBox.position = [Float(side) * 4.5, 0.06, 0]
            stadium.addChild(penaltyBox)
        }
    }
    
    /// MARK: soccer goals
    private func createGoals(_ stadium: Entity) {
        for side in [-1, 1] {
            let goalPost = createGoalInternals(side)
            goalPost.position = [Float(side) * 6, 0, 0]
            goalPost.orientation = simd_quatf(angle: Float(-1 * side) * .pi / 2, axis: [0, 1, 0])
            stadium.addChild(goalPost)
        }
    }
    
    private func createGoalInternals(_ side: Int) -> Entity {
        let goal = Entity()
        let postFoam = SimpleMaterial(color: .white, isMetallic: false)
        
        // create foam posts
        let postHeight: Float = 1.2
        let postRadius: Float = 0.05
        
        for x in [-1.0, 1.0] {
            let post = ModelEntity(
                mesh: .generateCylinder(height: postHeight, radius: postRadius),
                materials: [postFoam]
            )
            post.position = [Float(x), postHeight / 2, 0]
            goal.addChild(post)
        }
        
        // create crossbar
        let crossbar = ModelEntity(
            mesh: .generateCylinder(height: 2, radius: postRadius),
            materials: [postFoam]
        )
        crossbar.position = [0, postHeight, 0]
        crossbar.orientation = simd_quatf(angle: .pi / 2, axis: [0, 0, 1])
        goal.addChild(crossbar)
        
        // create netting
        let net = ModelEntity(
            mesh: .generateBox(width: 2, height: postHeight, depth: 0.8),
            materials: [SimpleMaterial(color: .white.withAlphaComponent(0.3), isMetallic: false)]
        )
        net.name = side == -1 ? "goalLeft" : "goalRight"

        net.position = [0, postHeight / 2, -0.4]

        // add a collision component for scoring detection
        let netCollision = CollisionComponent(
            shapes: [.generateBox(width: 2, height: postHeight, depth: 0.8)]
        )
        net.components.set(netCollision)
        
        goal.addChild(net)
        
        
        return goal
    }
    
    // create a field boundary to keep the ball from rolling off the field
    private func createFieldBoundaries(_ content: any RealityViewContentProtocol) {
        let fieldWidth: Float = 15
        let fieldDepth: Float = 12
        let wallThickness: Float = 0.2
        let wallHeight: Float = 1.0

        func makeWall(size: SIMD3<Float>, position: SIMD3<Float>) -> Entity {
            let wall = Entity()

            let collision = CollisionComponent(
                shapes: [.generateBox(size: size)]
            )

            var physics = PhysicsBodyComponent()
            physics.mode = .static

            wall.components.set(collision)
            wall.components.set(physics)

            // Optional: make it invisible
            let mat = SimpleMaterial(color: .clear, isMetallic: false)
            let model = ModelComponent(
                mesh: .generateBox(size: size),
                materials: [mat]
            )
            wall.components.set(model)

            wall.position = position
            return wall
        }

        let leftWall = makeWall(
            size: [wallThickness, wallHeight, fieldDepth],
            position: [-fieldWidth / 2, wallHeight / 2, 0]
        )

        let rightWall = makeWall(
            size: [wallThickness, wallHeight, fieldDepth],
            position: [fieldWidth / 2, wallHeight / 2, 0]
        )

        let topWall = makeWall(
            size: [fieldWidth, wallHeight, wallThickness],
            position: [0, wallHeight / 2, -fieldDepth / 2]
        )

        let bottomWall = makeWall(
            size: [fieldWidth, wallHeight, wallThickness],
            position: [0, wallHeight / 2, fieldDepth / 2]
        )

        content.add(leftWall)
        content.add(rightWall)
        content.add(topWall)
        content.add(bottomWall)
    }

    
    // create bleachers around the field
    private func createSeating(_ stadium: Entity) {
        // stadium seating colors
        let seatColors: [NSColor] = [.systemBlue, .systemRed, .systemYellow, .systemPurple]
        
        // side bleachers across
        for (i, side) in [1.0, -1.0].enumerated() {
            let bleacher = createBleacher(width: 14, height: 3, depth: 2, outward: Float(side))
            bleacher.position = [0, 1.5, Float(side) * 6]
            
            for child in bleacher.children {
                if let model = child as? ModelEntity {
                    model.model?.materials = [
                        SimpleMaterial(color: seatColors[i], isMetallic: false)
                    ]
                }
            }
            
            stadium.addChild(bleacher)
        }
                
        // end goal bleachers
        for (i, side) in [1.0, -1.0].enumerated() {
            let bleacher = createBleacher(width: 10, height: 3, depth: 2, outward: Float(side))
            bleacher.position = [Float(side) * 8, 1.5, 0]
            bleacher.orientation = simd_quatf(angle: .pi / 2, axis: [0, 1, 0])
            
            for child in bleacher.children {
                if let model = child as? ModelEntity {
                    model.model?.materials = [SimpleMaterial(color: seatColors[i + 2], isMetallic: false)]
                }
            }
            
            stadium.addChild(bleacher)
        }
    }

    private func createBleacher(width: Float, height: Float, depth: Float, outward: Float = 1.0) -> Entity {
        let bleacher = Entity()
        
        let levels = 5
        
        let levelDepthBase: Float = abs(depth) / Float(levels)
        let levelHeight: Float = height / Float(levels)
        
        for i in 0..<levels {
            let levelDepth = levelDepthBase
            
            let level = ModelEntity(
                mesh: .generateBox(width: width, height: 0.2, depth: levelDepth),
                materials: [SimpleMaterial(color: .systemGray, isMetallic: false)]
            )
            
            level.position = [
                0,
                Float(i) * levelHeight - height / 2,
                outward * Float(i) * levelDepth * 0.5
            ]
            
            bleacher.addChild(level)
        }
        
        return bleacher
    }

    // light poles for decoration
    private func createLighting(_ stadium: Entity, _ content: any RealityViewContentProtocol) {
        let lightPositions: [(Float, Float, Float)] = [
            (7.3, 2.5, 5.85),
            (7.3, 2.5, -5.85),
            (-7.3, 2.5, 5.85),
            (-7.3, 2.5, -5.85)
        ]
        
        for pos in lightPositions {
            let lightPole = ModelEntity(
                mesh: .generateCylinder(height: 5, radius: 0.1),
                materials: [SimpleMaterial(color: .darkGray, isMetallic: true)]
            )
            lightPole.position = [pos.0, pos.1, pos.2]
            
            let lightTop = ModelEntity(
                mesh: .generateBox(width: 0.5, height: 0.3, depth: 0.5),
                materials: [SimpleMaterial(color: .yellow, isMetallic: false)]
            )
            lightTop.position = [0, 2.65, 0]
            lightPole.addChild(lightTop)
            
            stadium.addChild(lightPole)
        }
        
        let light = DirectionalLight()
        light.light.intensity = 5000
        light.position = [0, 10, 0]
        light.look(at: [0, 0, 0], from: light.position, relativeTo: nil)
        content.add(light)
        
        let ambientLight = PointLight()
        ambientLight.light.intensity = 2000
        ambientLight.position = [0, 5, 0]
        content.add(ambientLight)
        
        content.add(light)
        content.add(ambientLight)
    }
}
