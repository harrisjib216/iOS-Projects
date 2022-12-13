//
//  GameScene.swift
//  TaxiTap
//
//  Created by Jibril Harris on 8/10/17.
//  Copyright © 2017 harrisjib. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    var canMove = false
    var center:CGFloat!
    var countDown = 1
    var scoreNumber = 0
    var stopGame = true
    var leftMoveLeft = false
    var rightMoveRight = false
    var leftCarAtRight = false
    var rightCarAtLeft = false
    var leftCar = SKSpriteNode()
    var scoreText = SKLabelNode()
    var rightCar = SKSpriteNode()
    let leftCarMinX:CGFloat = -100
    let leftCarMaxX:CGFloat = -280
    let rightCarMinX:CGFloat = 100
    let rightCarMaxX:CGFloat = 280


    // create road
    @objc func createRoad() {
        let leftRoad = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        leftRoad.strokeColor = SKColor.white
        leftRoad.fillColor = SKColor.white
        leftRoad.alpha = 0.4
        leftRoad.name = "leftRoad"
        leftRoad.zPosition = 10
        leftRoad.position.x = -190
        leftRoad.position.y = 700
        self.addChild(leftRoad)
        
        let rightRoad = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        rightRoad.strokeColor = SKColor.white
        rightRoad.fillColor = SKColor.white
        rightRoad.alpha = 0.4
        rightRoad.name = "rightRoad"
        rightRoad.zPosition = 10
        rightRoad.position.x = 190
        rightRoad.position.y = 700
        self.addChild(rightRoad)
    }
    
    // show road objects
    func showRoad() {
        enumerateChildNodes(withName: "leftRoad", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
        
        enumerateChildNodes(withName: "rightRoad", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
        
        enumerateChildNodes(withName: "leftTrafficObject", using: { (trafficCar, stop) in
            let leftTrafficObject = trafficCar as! SKSpriteNode
            leftTrafficObject.position.y -= 15
        })
        
        enumerateChildNodes(withName: "rightTrafficObject", using: { (trafficCar, stop) in
            let rightTrafficObject = trafficCar as! SKSpriteNode
            rightTrafficObject.position.y -= 15
        })
    }
    
    // make left traffic
    @objc func makeLeftTraffic() {
        if (!stopGame) {
            var leftTrafficItem:SKSpriteNode!
            let randomNummber = Helper().randomBetween(firstNum: 1, secondNum: 8)
        
            switch Int(randomNummber) {
            case 1...3:
                leftTrafficItem = SKSpriteNode(imageNamed: "bush.png")
                leftTrafficItem.name = "leftTrafficObject"
                break
            case 4...6:
                leftTrafficItem = SKSpriteNode(imageNamed: "greyCar.png")
                leftTrafficItem.name = "leftTrafficObject"
                break
            case 7...8:
                leftTrafficItem = SKSpriteNode(imageNamed: "rock.png")
                leftTrafficItem.name = "leftTrafficObject"
                break
            default:
                leftTrafficItem = SKSpriteNode(imageNamed: "greyCar.png")
                leftTrafficItem.name = "leftTrafficObject"
                break
            }
        
            leftTrafficItem.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            leftTrafficItem.zPosition = 10
            leftTrafficItem.size = CGSize(width: 71, height: 131)
            
        
            let randomNum = Helper().randomBetween(firstNum: 1, secondNum: 10)
            switch Int(randomNum) {
            case 1...4:
                leftTrafficItem.position.x = -280
                break
            case 5...10:
                leftTrafficItem.position.x = -100
                break
            default:
                leftTrafficItem.position.x = -280
                break
            }
        
            leftTrafficItem.position.y = 700
            leftTrafficItem.physicsBody = SKPhysicsBody(circleOfRadius: leftTrafficItem.size.height / 2)
            leftTrafficItem.physicsBody?.categoryBitMask = ColliderType.ITEM_COLLIDER1
            leftTrafficItem.physicsBody?.collisionBitMask = 0
            leftTrafficItem.physicsBody?.affectedByGravity = false
            self.addChild(leftTrafficItem)
        }
    }
    
    // make right traffic
    @objc func makeRightTraffic() {
        if (!stopGame) {
            var rightTrafficItem:SKSpriteNode!
            let randomNummber = Helper().randomBetween(firstNum: 1, secondNum: 8)
        
            switch Int(randomNummber) {
            case 1...3:
                rightTrafficItem = SKSpriteNode(imageNamed: "bush.png")
                rightTrafficItem.name = "rightTrafficObject"
                break
            case 4...6:
                rightTrafficItem = SKSpriteNode(imageNamed: "greyCar.png")
                rightTrafficItem.name = "rightTrafficObject"
                break
            case 7...8:
                rightTrafficItem = SKSpriteNode(imageNamed: "rock.png")
                rightTrafficItem.name = "rightTrafficObject"
                break
            default:
                rightTrafficItem = SKSpriteNode(imageNamed: "greyCar.png")
                rightTrafficItem.name = "rightTrafficObject"
                break
            }
        
            rightTrafficItem.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            rightTrafficItem.zPosition = 10
            rightTrafficItem.size = CGSize(width: 71, height: 131)
        
        
            let randomNum = Helper().randomBetween(firstNum: 1, secondNum: 10)
            switch Int(randomNum) {
            case 1...4:
                rightTrafficItem.position.x = 280
                break
            case 5...10:
                rightTrafficItem.position.x = 100
                break
            default:
                rightTrafficItem.position.x = 280
                break
            }
        
            rightTrafficItem.position.y = 700
            rightTrafficItem.physicsBody = SKPhysicsBody(circleOfRadius: rightTrafficItem.size.height / 2)
            rightTrafficItem.physicsBody?.categoryBitMask = ColliderType.ITEM_COLLIDER1
            rightTrafficItem.physicsBody?.collisionBitMask = 0
            rightTrafficItem.physicsBody?.affectedByGravity = false
            self.addChild(rightTrafficItem)
        }
    }
    
    // increase score
    @objc func increaseScore() {
        if (!stopGame) {
            scoreNumber += 1
            scoreText.text = "\(scoreNumber)"
        }
    }

    // move left
    func moveLeft(car: SKSpriteNode) {
        if (car == leftCar) {
            leftCar.position.x = leftCarMaxX
        }
        else {
            rightCar.position.x = rightCarMinX
        }
    }
    
    // move right
    func moveRight(car: SKSpriteNode) {
        if (car == leftCar) {
            leftCar.position.x = leftCarMinX
        }
        else {
            rightCar.position.x = rightCarMaxX
        }
    }
    
    
    // set up
    func setUp() {
        center = self.frame.size.width / self.frame.size.height
        leftCar = self.childNode(withName: "leftCar") as! SKSpriteNode
        rightCar = self.childNode(withName: "rightCar") as! SKSpriteNode
        
        leftCar.physicsBody?.categoryBitMask = ColliderType.CAR_COLLIDER
        leftCar.physicsBody?.contactTestBitMask = ColliderType.ITEM_COLLIDER1
        leftCar.physicsBody?.collisionBitMask = 0
        
        rightCar.physicsBody?.categoryBitMask = ColliderType.CAR_COLLIDER
        rightCar.physicsBody?.contactTestBitMask = ColliderType.ITEM_COLLIDER1
        rightCar.physicsBody?.collisionBitMask = 0
        
        
        let scoreGround = SKShapeNode(rect: CGRect(x: -self.size.width / 2 + 70, y: self.size.width / 2 + 130, width: 180, height: 80), cornerRadius: 20)
        scoreGround.zPosition = 4
        scoreGround.fillColor = SKColor.black.withAlphaComponent(0.3)
        scoreGround.strokeColor = SKColor.black.withAlphaComponent(0.3)
        self.addChild(scoreGround)
        
        scoreText.name = "score"
        scoreText.fontName = "futura"
        scoreText.text = "0"
        scoreText.fontColor = SKColor.white
        scoreText.position = CGPoint(x: -self.size.width / 2 + 160, y: self.size.width / 2 + 150)
        scoreText.fontSize = 50
        scoreText.zPosition = 4
        self.addChild(scoreText)
    }
    
    // delete old nodes
    @objc func removeItems() {
        for child in children {
            if child.position.y < -self.size.height - 100 {
                child.removeFromParent()
            }
        }
    }
    
    // make the road each frame
    override func update(_ currentTime: TimeInterval) {
        showRoad()
    }
    
    // create touches
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if (contact.bodyA.node?.name == "leftCar" || contact.bodyA.node?.name == "rightCar") {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        firstBody.node?.removeFromParent()
        afterCollision()
    }
    
    // load game
    @objc func startCountDown() {
        if (countDown > 0) {
            if (countDown < 4) {
                let countDwnLabel = SKLabelNode()
                countDwnLabel.fontName = "futura"
                countDwnLabel.fontColor = SKColor.white
                countDwnLabel.fontSize = 240
                countDwnLabel.text = "\(countDown)"
                countDwnLabel.position = CGPoint(x: 0, y: 400)
                countDwnLabel.zPosition = 200
                countDwnLabel.name = "countDwnLabel"
                countDwnLabel.horizontalAlignmentMode = .center
                self.addChild(countDwnLabel)
                
                let deadTime = DispatchTime.now() + 0.5
                DispatchQueue.main.asyncAfter(deadline: deadTime, execute: {
                    countDwnLabel.removeFromParent()
                })
            }
            
            countDown += 1
            if (countDown == 4){
                self.stopGame = false
            }
        }
    }
    
    // when player dies
    func afterCollision() {
        let menuScene = SKScene(fileNamed: "GameMenu")!
        lastScore = scoreNumber
        menuScene.scaleMode = .aspectFill
        self.view?.presentScene(menuScene, transition: SKTransition.doorsCloseHorizontal(withDuration: TimeInterval(2)))
    }
    
    // view did load
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
        physicsWorld.contactDelegate = self
        Timer.scheduledTimer(timeInterval: TimeInterval(0.3), target: self, selector: #selector(GameScene.createRoad), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.startCountDown), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(Helper().randomBetween(firstNum: 0, secondNum: 1.8)), target: self, selector: #selector(GameScene.makeLeftTraffic), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(Helper().randomBetween(firstNum: 0, secondNum: 1.8)), target: self, selector: #selector(GameScene.makeRightTraffic), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(GameScene.removeItems), userInfo: nil, repeats: true)
        
        let deadTime = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: deadTime, execute: {
            Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.increaseScore), userInfo: nil, repeats: true)
        })
    }
    
    // screen was touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            if (touchLocation.x > center) {
                if (rightCarAtLeft) {
                    // move right
                    rightCarAtLeft = false
                    rightMoveRight = true
                    moveRight(car: rightCar)
                    
                }
                else {
                    // move left
                    rightCarAtLeft = true
                    rightMoveRight = false
                    moveLeft(car: rightCar)
                }
            }
            else {
                if (leftCarAtRight) {
                    // move right
                    leftCarAtRight = false
                    leftMoveLeft = true
                    moveRight(car: leftCar)
                }
                else {
                    // move left
                    leftCarAtRight = true
                    leftMoveLeft = false
                    moveLeft(car: leftCar)
                }
            }
            canMove = true
        }
    }
}
