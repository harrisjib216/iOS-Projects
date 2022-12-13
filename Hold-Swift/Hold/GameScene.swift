//
//  GameScene.swift
//  Hold
//
//  Created by Jibril Harris on 2/25/17.
//  Copyright © 2017 harrisjib. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    // our player
    var player:SKSpriteNode!
    var player2:SKSpriteNode!
    var initalPlayerPosition:CGPoint!
    
    // move when touched
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let maxForce = touch.maximumPossibleForce
            let force = touch.force
            let normalForce = force / maxForce
            
            // update player position based on force
            player.position.x = (self.size.width / 2) - normalForce * (self.size.width / 2 - 25)
            player2.position.x = (self.size.width / 2) + normalForce * (self.size.width / 2 - 25)

        }
    }
    
    // when not pressed, reset
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetPlayerPosition()
    }
    
    // reset player
    func resetPlayerPosition() {
        player.position = initalPlayerPosition
        player2.position = initalPlayerPosition
    }
    
    // make rows for the game
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        // add each player
        addPlayer()
        addRow(type: RowType.twoM)
        
    }
    
    // add random row
    func addRandomRow() {
        let randomNum = Int(arc4random_uniform(6))
        
        switch randomNum {
        case 0:
            addRow(type: RowType(rawValue: 0)!)
            break
        case 1:
            addRow(type: RowType(rawValue: 1)!)
            break
        case 2:
            addRow(type: RowType(rawValue: 2)!)
            break
        case 3:
            addRow(type: RowType(rawValue: 3)!)
            break
        case 4:
            addRow(type: RowType(rawValue: 4)!)
            break
        case 5:
            addRow(type: RowType(rawValue: 5)!)
            break
        case 6:
            addRow(type: RowType(rawValue: 6)!)
            break
        default:
            break
        }
    }
    
    // update time interval
    var lastUpdateTimeInterval = TimeInterval()
    var lastYieldTimeInterval = TimeInterval()
    func updateWithTimeSinceLastUpdate(timeSinceLastUpdate:CFTimeInterval) {
        lastYieldTimeInterval += timeSinceLastUpdate
        if lastYieldTimeInterval > 0.6 {
            lastYieldTimeInterval = 0
            addRandomRow()
        }
    }
    
    // update
    override func update(_ currentTime: CFTimeInterval) {
        var timeSinceLastUpdate = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        if timeSinceLastUpdate > 1 {
            timeSinceLastUpdate = 1/60
            lastUpdateTimeInterval = currentTime
        }
        updateWithTimeSinceLastUpdate(timeSinceLastUpdate: timeSinceLastUpdate)
    }
    
    // if contact is made
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "PLAYER" {
            print("GAME OVER")
            showGameOver()
        }
        
    }
    
    // show game over
    func showGameOver () {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameOverScene = GameOverScene(size: self.size)
        self.view?.presentScene(gameOverScene, transition: transition)
    }
}
