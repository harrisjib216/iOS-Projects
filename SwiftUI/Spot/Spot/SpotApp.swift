//
//  SpotApp.swift
//  Spot
//
//  Created by development on 3/7/25.
//

import SwiftUI
import SwiftData

@main
struct SpotApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Post.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            FeedScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
