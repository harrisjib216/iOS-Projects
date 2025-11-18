//
//  Camera.swift
//  RC Soccer
//
//  Created by jibril harris on 11/18/25.
//

import SwiftUI
import RealityKit

extension GameView {
    func createCamera(_ content: any RealityViewContentProtocol) {
        let camera = Entity()
        camera.components.set(PerspectiveCameraComponent())

        let cameraLocation: SIMD3<Float> = [0, 7, 10] // [-1, 1, 0]
        camera.look(at: [0, 0, 0], from: cameraLocation, relativeTo: nil)
        
        content.add(camera)
    }
}
