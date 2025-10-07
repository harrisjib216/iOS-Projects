//
//  ContentView.swift
//  WeSplit
//
//  Created by development on 3/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 0
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    var billPlusTip: Double {
        (checkAmount * Double(tipPercentage) / 100.00 + checkAmount)
    }
        
    var billPerPerson: Double {
        billPlusTip / Double(numOfPeople + 2)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Your check and group size") {
                    HStack {
                        Text("Check amount")
                        TextField("Check amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                        
                    
                    Picker("Group size", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Your preferred tip") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Bill total") {
                    Text(billPlusTip, format: .currency(code:  Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text(billPerPerson, format: .currency(code:  Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
