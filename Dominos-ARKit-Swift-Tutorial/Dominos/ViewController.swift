//
//  ViewController.swift
//  Dominos
//
//  Created by objcmate on 2/21/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import SceneKit
import ARKit


class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    var detectedPlanes: [String : SCNNode] = [:]
    let dominoColors: [UIColor] = [.red, .blue, .green, .yellow, .orange, .cyan, .magenta, .purple]
    var bricks: [SCNNode] = [] // dominoes
    var previousBrickPosition: SCNVector3?
    
    
    
    // begin session if possible
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    
    
    // view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        
        // stats
        sceneView.showsStatistics = true
        
        // Set the scene to the view
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.scene.physicsWorld.timeStep = 1/200
        
        
        // pan to draw bricks
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(screenPanned))
        sceneView.addGestureRecognizer(panGesture)
        addLighting()
    }
    
    
    
    // pasuse session
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    
    // add the node and surface
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // create anchor to flat surface
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // set-make plane to anchor
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        plane.firstMaterial?.colorBufferWriteMask = .init(rawValue: 0)
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3Make(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        
        // styling
        planeNode.opacity = 0.0
        planeNode.rotation = SCNVector4Make(1, 0, 0, -Float.pi / 2.0)
        
        
        let box = SCNBox(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z), length: 0.001, chamferRadius: 0)
        planeNode.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(geometry: box, options: nil))
        node.addChildNode(planeNode)
        
        // add the node
        detectedPlanes[planeAnchor.identifier.uuidString] = planeNode
    }
    
    
    
    // update the plane as the user moves/walks
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // update the plane node's values
        guard let planeNode = detectedPlanes[planeAnchor.identifier.uuidString] else { return }
        
        // make the plane again
        let planeGeometry = planeNode.geometry as! SCNPlane
        planeGeometry.width = CGFloat(planeAnchor.extent.x)
        planeGeometry.height = CGFloat(planeAnchor.extent.z)
        
        // update position - new position
        planeNode.position = SCNVector3Make(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        
        // move with the plane
        let box = SCNBox(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z), length: 0.001, chamferRadius: 0)
        planeNode.physicsBody?.physicsShape = SCNPhysicsShape(geometry: box, options: nil)
    }
    
    
    
    // draw the bricks
    @objc func screenPanned(gesture: UIPanGestureRecognizer) {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        // when "guesture" is made, get it's position
        let location = gesture.location(in: sceneView)
        guard let hitTestResult = sceneView.hitTest(location, types: .existingPlane).first else { return }
        
        // get the brick's last pos -- coord.
        guard let previousPosition = previousBrickPosition else {
            self.previousBrickPosition = SCNVector3Make(
                hitTestResult.worldTransform.columns.3.x,
                hitTestResult.worldTransform.columns.3.y,
                hitTestResult.worldTransform.columns.3.z
            )
            
            return
        }
        
        // get the (x, y, z)
        let currentPosition = SCNVector3Make(
            hitTestResult.worldTransform.columns.3.x,
            hitTestResult.worldTransform.columns.3.y,
            hitTestResult.worldTransform.columns.3.z
        )
        
        // make each "brick" -- domino + distance
        let distance = distanceBetween(point1: previousPosition, andPoint2: currentPosition)
        if distance >= 0.03 {
            // load each brick into the screen
            let brickGeometry = SCNBox(width: 0.007, height: 0.06, length: 0.03, chamferRadius: 0.0)
            brickGeometry.firstMaterial?.diffuse.contents = dominoColors.randomElement()
            
            // make the node - arkit
            let brickNode = SCNNode(geometry: brickGeometry)
            brickNode.position = SCNVector3Make(
                currentPosition.x,
                currentPosition.y + 0.03, // space each brick
                currentPosition.z
            )
            
            // angle the bricks
            var currentAngle: Float = pointPairToBearingDegrees(startingPoint: CGPoint(x: CGFloat(currentPosition.x), y: CGFloat(currentPosition.z)), secondPoint: CGPoint(x: CGFloat(previousPosition.x), y: CGFloat(previousPosition.z)))
            currentAngle *= .pi / 180
            brickNode.rotation = SCNVector4Make(0, 1, 0, -currentAngle)
            
            // append the bricks
            brickNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
            brickNode.physicsBody?.mass = 2.0
            brickNode.physicsBody?.friction = 0.8
            sceneView.scene.rootNode.addChildNode(brickNode)
            bricks.append(brickNode)
            
            // lastly, update the positions
            self.previousBrickPosition = currentPosition
        }
    }
    
    
    
    // return the dist. between each brick
    func distanceBetween(point1: SCNVector3, andPoint2 point2: SCNVector3) -> Float {
        return hypotf(Float(point1.x - point2.x), Float(point1.z - point2.z))
    }
    
    
    
    // lighting for the bricks
    func addLighting() {
        // style
        let directionalLight = SCNLight()
        directionalLight.type = .directional
        directionalLight.intensity = 500
        directionalLight.castsShadow = true
        directionalLight.shadowMode = .deferred
        directionalLight.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        // add to the node
        let directionalLightNode = SCNNode()
        directionalLightNode.light = directionalLight
        directionalLightNode.rotation = SCNVector4Make(1, 0, 0, -Float.pi / 3)
        sceneView.scene.rootNode.addChildNode(directionalLightNode)
        
        // push lighting
        let ambientLight = SCNLight()
        ambientLight.intensity = 50
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        sceneView.scene.rootNode.addChildNode(ambientLightNode)
    }
    
    
    // angle each brick
    func pointPairToBearingDegrees(startingPoint: CGPoint, secondPoint endingPoint: CGPoint) -> Float{
        let originPoint: CGPoint = CGPoint(x: startingPoint.x - endingPoint.x, y: startingPoint.y - endingPoint.y)
        let bearingRadians = atan2f(Float(originPoint.y), Float(originPoint.x))
        let bearingDegrees = bearingRadians * (180.0 / Float.pi)
        return bearingDegrees
    }
    
    
    // reset the game
    @IBAction func reset(_ sender: Any) {
        for brick in bricks {
            brick.removeFromParentNode()
            self.previousBrickPosition = nil
        }
        
        bricks = []
    }
    
    
    
    // start the game
    @IBAction func fall(_ sender: Any) {
        guard let firstBrick = bricks.first else { return }
        
        let power: Float = 0.7
        firstBrick.physicsBody?.applyForce(
            SCNVector3Make(
                firstBrick.worldRight.x * power,
                firstBrick.worldRight.y * power,
                firstBrick.worldRight.z * power
            ),
            
            asImpulse: true
        )
        
    }
    
    
    
    // if session fails -- fix
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    
    
    // if the session is interrupted -- fix
    func sessionWasInterrupted(_ session: ARSession) {
        sceneView.session.pause()
    }
    
    
    
    // session continue -- fix
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
}
