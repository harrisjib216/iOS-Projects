//
//  GameOverScene.swift
//  Hold
//
//  Created by Jibril Harris on 2/25/17.
//  Copyright © 2017 harrisjib. All rights reserved.
//


import SpriteKit

class GameOverScene: SKScene {
    
    // something
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // show game over
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor.black
        let message = "GAME OVER"
        let label = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        label.text = message
        label.fontColor = SKColor.white
        label.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        addChild(label)
    }
    
    // when pressed, show game
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: transition)
    }
}
