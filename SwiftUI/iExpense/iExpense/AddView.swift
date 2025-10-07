//
//  AddView.swift
//  iExpense
//
//  Created by jibril harris on 4/6/25.
//

import SwiftUI

let types = ["Business", "Personal"]

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var price = 0.0
    
    let expenses: Expenses
    let currencyCode: String
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { item in
                        Text(item)
                    }
                }
                
                TextField("Price", value: $price, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    expenses.addItem(name, type, price)
                    dismiss()
                }
                .disabled(name.isEmpty)
            }
        }
    }
}

#Preview {
    @Previewable @State var expenses = Expenses()
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    AddView(expenses: expenses, currencyCode: currencyCode)
}
