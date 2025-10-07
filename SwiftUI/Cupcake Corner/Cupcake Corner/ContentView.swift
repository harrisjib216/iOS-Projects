//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by jibril harris on 5/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) { index in
                            Text(Order.types[index])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests?", isOn: $order.specialRequestsEnabled.animation())
                    
                    if order.specialRequestsEnabled {
                        Toggle("Add extra frosting?", isOn: $order.extraFrosting)
                        
                        Toggle("Add sprinkles?", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Deliver details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
