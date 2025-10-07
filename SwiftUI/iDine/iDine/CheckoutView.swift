//
//  CheckoutView.swift
//  iDine
//
//  Created by jibril harris on 7/5/25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Card", "iDine Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyId = ""
    
    let tipOptions = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    var totalPrice: String {
        let total = Double(order.total)
        let tip = total / 100 * Double(tipAmount)
        return (total + tip).formatted(.currency(code: "USD"))
    }
    
    @State private var showConfirmAlert = false
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine id", text: $loyaltyId)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipOptions, id: \.self) { percent in
                        Text("\(percent)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    showConfirmAlert.toggle()
                }
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed!", isPresented: $showConfirmAlert) {
            Button("Ok") { }
        } message: {
            Text("Thank you!")
        }
    }
}

#Preview {
    let order = Order()
    order.add(item: .example)
    
    return CheckoutView()
        .environmentObject(order)
}
