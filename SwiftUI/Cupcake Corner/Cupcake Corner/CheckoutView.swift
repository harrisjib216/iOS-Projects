//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by jibril harris on 5/15/25.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmatiomMsg = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("Ok") { }
        } message: {
            Text(confirmatiomMsg)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var req = URLRequest(url: url)
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: req, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            confirmatiomMsg = "Your order for \(decodedOrder.quantity) \(Order.types[decodedOrder.type].lowercased()) cupcakes is on the way"
        } catch {
            print("Check out failed: \(error.localizedDescription)")
        } 
    }
}

#Preview {
    CheckoutView(order: Order())
}
