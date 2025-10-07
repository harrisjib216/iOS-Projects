//
//  CreateViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/4/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation


class CreateViewController: UIViewController {
    private let session = AVCaptureSession()
    var previewView:AVCaptureVideoPreviewLayer!
    var input:AVCaptureDeviceInput!
    var device:AVCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewView = AVCaptureVideoPreviewLayer()
        previewView.session = session
    }
    
    
    // flip camera
    @IBAction func toggleCam(_ sender: Any) {
        if (device.position == .back) {
            self.device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)!
        }
        else {
            self.device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)!
        }
    }

    
    // toggle flash
    @IBAction func toggleFlash(_ sender: Any) {
        if (device.position == .back) {
            self.device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)!
        }
        else {
            self.device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)!
        }
    }
}
