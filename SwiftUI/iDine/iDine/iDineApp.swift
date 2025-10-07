//
//  iDineApp.swift
//  iDine
//
//  Created by jibril harris on 7/5/25.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
