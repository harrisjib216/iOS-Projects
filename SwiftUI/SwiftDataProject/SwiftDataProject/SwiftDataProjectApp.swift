//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by jibril harris on 5/19/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
