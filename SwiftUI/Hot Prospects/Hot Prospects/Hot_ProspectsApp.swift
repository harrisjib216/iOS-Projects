//
//  Hot_ProspectsApp.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI
import SwiftData

@main
struct Hot_ProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
