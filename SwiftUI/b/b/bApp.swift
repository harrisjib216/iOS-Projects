//
//  bApp.swift
//  b
//
//  Created by development on 3/19/25.
//

import SwiftUI

@main
struct bApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
