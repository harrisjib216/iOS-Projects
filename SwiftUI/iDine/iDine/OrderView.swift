//
//  OrderView.swift
//  iDine
//
//  Created by jibril harris on 7/5/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            
                            Spacer()
                            
                            Text(item.price, format: .currency(code: "USD"))
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place order") {
                        CheckoutView()
                    }
                    .disabled(order.items.isEmpty)
                }
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    let order = Order()
    order.add(item: MenuItem.example)
    
    return OrderView()
        .environmentObject(order)
}
