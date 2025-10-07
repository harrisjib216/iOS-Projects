//
//  BookWormApp.swift
//  BookWorm
//
//  Created by jibril harris on 5/16/25.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
