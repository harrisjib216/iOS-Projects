//
//  ViewController.swift
//  Stack and Crash
//
//  Created by development on 9/7/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var colorOptionContainer: UIView!
    @IBOutlet weak var clearBtn: UIButton!
    
    let PenColors = [
        UIColor(red: 0.96, green: 0.26, blue: 0.21, alpha: 1.00),
        UIColor(red: 1.00, green: 0.60, blue: 0.00, alpha: 1.00),
        UIColor(red: 1.00, green: 0.92, blue: 0.23, alpha: 1.00),
        UIColor(red: 0.30, green: 0.69, blue: 0.31, alpha: 1.00),
        UIColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1.00),
        UIColor(red: 0.61, green: 0.15, blue: 0.69, alpha: 1.00),
    ]
    
    var selectedColor = UIColor()
    var selectedOptionBtn = UIButton()
    var detectedPlanes: [String : SCNNode] = [:]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        
        // ar scene
        makeARScene()
        
        // gesture for drawing
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(screenPanned))
        sceneView.addGestureRecognizer(panGesture)
        
        // color options
        setUpColorOptions()
    }
    
    
    func makeARScene() {
        sceneView.scene = SCNScene()
    }
    
    @IBAction func clearScreen(_ sender: Any) {
        makeARScene()
    }
    
    @objc func screenPanned(gesture: UIPanGestureRecognizer) {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)

        let location = gesture.location(in: sceneView)
        
        guard let hitTestResult = sceneView.hitTest(location, types: .existingPlane).first else { return }
        
        let currentPosition = SCNVector3Make(
            hitTestResult.worldTransform.columns.3.x,
            hitTestResult.worldTransform.columns.3.y,
            hitTestResult.worldTransform.columns.3.z
        )

        let dotGeometry = SCNBox(
            width: 0.005,
            height: 0.005,
            length: 0.005,
            chamferRadius: 0.00025
        )
        
        dotGeometry.firstMaterial?.diffuse.contents = selectedColor
        
        let dotNode = SCNNode(geometry: dotGeometry)
        dotNode.position = SCNVector3Make(
            currentPosition.x,
            currentPosition.y + 0.03,
            currentPosition.z
        )
        
        sceneView.scene.rootNode.addChildNode(dotNode)
    }
    
    func setUpColorOptions() {
        // clear btn
        clearBtn.setRadius()
        clearBtn.transform = clearBtn.transform.rotated(by: CGFloat.pi / 2)
        
        // setting initial color
        selectedColor = PenColors[0]
        
        var basePos = 30
        
        for index in 0..<PenColors.count {
            let optionBtn = UIButton()
            optionBtn.tag = index

            if (optionBtn.tag == 0) {
                selectedOptionBtn = optionBtn
                optionBtn.makeSelected()
            }
            
            optionBtn.setRadius()
            optionBtn.frame = CGRect(x: basePos, y: 10, width: 40, height: 40)
            optionBtn.backgroundColor = PenColors[index]
            optionBtn.addTarget(self, action: #selector(updateSelectedColor), for: .touchUpInside)
            
            colorOptionContainer.addSubview(optionBtn)
            
            basePos += 55
        }
    }
    
    @objc func updateSelectedColor(_ sender: UIButton) {
        // deselect previous color
        selectedOptionBtn.makeUnSelected()
        
        // update color and btn
        selectedOptionBtn = sender
        selectedColor = PenColors[selectedOptionBtn.tag]
        selectedOptionBtn.makeSelected()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }

        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))

        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3Make(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        planeNode.opacity = 0.3
        planeNode.rotation = SCNVector4Make(1, 0, 0, -Float.pi / 2.0)

        node.addChildNode(planeNode)

        detectedPlanes[planeAnchor.identifier.uuidString] = planeNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        guard let planeNode = detectedPlanes[planeAnchor.identifier.uuidString] else { return }
        
        let planeGeometry = planeNode.geometry as! SCNPlane
        planeGeometry.width = CGFloat(planeAnchor.extent.x)
        planeGeometry.height = CGFloat(planeAnchor.extent.z)
        planeNode.position = SCNVector3Make(
            planeAnchor.center.x,
            planeAnchor.center.y,
            planeAnchor.center.z
        )
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
}

extension UIButton {
    func makeSelected() {
        self.layer.borderWidth = 4.0
        self.layer.borderColor = CGColor(red: 0.01, green: 0.66, blue: 0.96, alpha: 1.0)
    }
    
    func makeUnSelected() {
        self.layer.borderWidth = 0.0
        self.layer.borderColor = nil
    }
    
    func setRadius() {
        self.layer.cornerRadius = 10.0
    }
}
