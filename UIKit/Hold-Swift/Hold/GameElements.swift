//
//  GameElements.swift
//  Hold
//
//  Created by Jibril Harris on 2/25/17.
//  Copyright © 2017 harrisjib. All rights reserved.
//

import SpriteKit

// colision
struct CollisionBitMask {
    static let Player:UInt32 = 0x00
    static let Obstacle:UInt32 = 0x01
}

// obstacle object
enum ObstacleType:Int {
    case Small = 0
    case Medium = 1
    case Large = 2
}

// row times
enum RowType:Int {
    case oneS = 0
    case oneM = 1
    case oneL = 2
    case twoS = 3
    case twoM = 4
    case threeS = 5
}


// the game scene
extension GameScene {
    
    func addPlayer() {
        // player 1
        player = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        player.position = CGPoint(x: self.size.width / 2, y: 350)
        player.name = "PLAYER"
        player.physicsBody?.isDynamic = false
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = CollisionBitMask.Player
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.contactTestBitMask = CollisionBitMask.Obstacle
        
        // player 2
        player2 = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        player2.position = CGPoint(x: self.size.width / 2, y: 350)
        player2.name = "PLAYER"
        player2.physicsBody?.isDynamic = false
        player2.physicsBody = SKPhysicsBody(rectangleOf: player2.size)
        player2.physicsBody?.categoryBitMask = CollisionBitMask.Player
        player2.physicsBody?.collisionBitMask = 0
        player2.physicsBody?.contactTestBitMask = CollisionBitMask.Obstacle
        
        // add children
        addChild(player)
        addChild(player2)
        
        // players position
        initalPlayerPosition = player.position
    }
    
    
    // add obstacle
    func addObstacle (type:ObstacleType) -> SKSpriteNode {
        
        // create the obstacle
        let obstacle = SKSpriteNode(color: UIColor.white, size: CGSize(width: 0, height: 30))
        obstacle.name = "OBSTACLE"
        obstacle.physicsBody?.isDynamic = true
        
        // give the corresponding size
        switch type {
        case .Small:
            obstacle.size.width = self.size.width * 0.2
            break
        case .Medium:
            obstacle.size.width = self.size.width * 0.40
            break
        case .Large:
            obstacle.size.width = self.size.width * 0.75
            break
        }
        
        // obstacle position
        obstacle.position = CGPoint(x: 0, y: self.size.height + obstacle.size.height)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.physicsBody?.categoryBitMask = CollisionBitMask.Obstacle
        obstacle.physicsBody?.collisionBitMask = 0
        
        // present obstacle
        return obstacle
    }
    
    
    // add movement
    func addMovement (obstacle:SKSpriteNode) {
        // move obstacle down, the remove the obstacle
        var actionArray = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x: obstacle.position.x, y: -obstacle.size.height), duration: TimeInterval(3)))
        actionArray.append(SKAction.removeFromParent())
        obstacle.run(SKAction.sequence(actionArray))
    }

    
    // add a row
    func addRow(type:RowType) {
        switch type {
        
        // small
        case .oneS:
            let obst = addObstacle(type: .Small)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y) // center
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .twoS:
            let obst1 = addObstacle(type: .Small)
            let obst2 = addObstacle(type: .Small)
            obst1.position = CGPoint(x: obst1.size.width + 150, y: obst1.position.y) // left
            obst2.position = CGPoint(x: self.size.width - obst2.size.width - 150, y: obst2.position.y) // right
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            addChild(obst1)
            addChild(obst2)
            break
        case .threeS:
            let obst1 = addObstacle(type: .Small)
            let obst2 = addObstacle(type: .Small)
            let obst3 = addObstacle(type: .Small)
            obst1.position = CGPoint(x: obst1.size.width - 35, y: obst1.position.y) // left
            obst2.position = CGPoint(x: self.size.width / 2, y: obst2.position.y) // center
            obst3.position = CGPoint(x: self.size.width - obst3.size.width + 35, y: obst3.position.y) // right
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            addMovement(obstacle: obst3)
            addChild(obst1)
            addChild(obst2)
            addChild(obst3)
            break
            
        // medium
        case .oneM:
            let obst = addObstacle(type: .Medium)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y) // center
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .twoM:
            let obst1 = addObstacle(type: .Medium)
            let obst2 = addObstacle(type: .Medium)
            obst1.position = CGPoint(x: obst1.size.width - 200, y: obst1.position.y) // left
            obst2.position = CGPoint(x: self.size.width - obst2.size.width + 200, y: obst2.position.y) // right
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            addChild(obst1)
            addChild(obst2)
            break
            
        // large
        case .oneL:
            let obst = addObstacle(type: .Large)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y) // center
            addMovement(obstacle: obst)
            addChild(obst)
            break
        }
    }
}
