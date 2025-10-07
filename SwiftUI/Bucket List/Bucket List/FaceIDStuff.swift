//
//  ContentView.swift
//  Bucket List
//
//  Created by jibril harris on 6/7/25.
//

import LocalAuthentication
import SwiftUI

struct FaceIDStuff: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("unlocked")
            } else {
                Text("locked")
            }
        }
            .onAppear {
            authenticate()
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "To protect your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if success {
                    isUnlocked = true
                } else {
                    // failed
                }
            }
            
        } else {
            // no biometrics
        }
    }
}

#Preview {
    FaceIDStuff()
}
