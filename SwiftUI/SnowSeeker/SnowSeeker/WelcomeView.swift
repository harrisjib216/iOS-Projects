//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by jibril harris on 6/26/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the menu; swipe from the edge to show the menu")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
