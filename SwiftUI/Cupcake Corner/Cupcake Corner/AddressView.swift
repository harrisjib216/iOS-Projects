//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by jibril harris on 5/15/25.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                
                Section {
                    NavigationLink("Checkout") {
                        CheckoutView(order: order)
                    }
                }
                .disabled(!order.hasValidAddress)
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
