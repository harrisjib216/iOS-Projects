//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by jibril harris on 6/17/25.
//

import SwiftUI

struct VoiceInputView: View {
    var body: some View {
        VStack {
            Button("John Fitzgerald Kennedy") {
                print("tapped")
            }
            .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
        }
        .padding()
    }
}

#Preview {
    VoiceInputView()
}
