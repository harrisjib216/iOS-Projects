//
//  GameMenu.swift
//  TaxiTap
//
//  Created by Jibril Harris on 8/10/17.
//  Copyright © 2017 harrisjib. All rights reserved.
//

import Foundation
import SpriteKit


class GameMenu: SKScene {
    var startGame = SKLabelNode()
    var lastScoreLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        startGame = self.childNode(withName: "begin") as! SKLabelNode
        lastScoreLabel = self.childNode(withName: "lastScore") as! SKLabelNode
        lastScoreLabel.text = "last score: \(lastScore)"
    }

    
    override func update(_ currentTime: TimeInterval) {
        lastScoreLabel.text = "last score: \(lastScore)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
         
            if (atPoint(touchLocation).name == "begin") {
                let gameScene = SKScene(fileNamed: "GameScene")!
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
        }
    }
    
    
}
