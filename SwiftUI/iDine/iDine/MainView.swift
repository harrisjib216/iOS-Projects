//
//  MainView.swift
//  iDine
//
//  Created by jibril harris on 7/5/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            Tab("Menu", systemImage: "list.dash") {
                ContentView()
            }
            
            Tab("Order", systemImage: "square.and.pencil") {
                OrderView()
            }
        }
    }
}

#Preview {
    let order = Order()
    order.add(item: MenuItem.example)
    
    return MainView()
        .environmentObject(order)
}
