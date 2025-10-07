//
//  ContentView.swift
//  Unit Tool
//
//  Created by development on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    let units = ["Kilometer", "Meter", "Centimeter", "Millimeter"]
    @State private var input = 0.0
    @State private var baseUnit = "Meter"
    @State private var targetUnit = "Kilometer"
    
    var conversion: Double {
        var multiplicandAsMilimeters = 0.0
        var multiplier = 0.0
        
        if (baseUnit == targetUnit) {
            return input
        }
        
        switch (baseUnit) {
        case "Millimeter":
            multiplicandAsMilimeters = input
        case "Centimeter":
            multiplicandAsMilimeters = input * 10.0
        case "Meter":
            multiplicandAsMilimeters = input * 1000.0
        case "Kilometer":
            multiplicandAsMilimeters = input * 1_000_000.0
        default:
            multiplicandAsMilimeters = 0.0
        }
        
        switch (targetUnit) {
        case "Millimeter":
            multiplier = 1.0
        case "Centimeter":
            multiplier = 0.1
        case "Meter":
            multiplier = 0.001
        case "Kilometer":
            multiplier = 0.000001
        default:
            multiplier = 0.0
        }
        
        return multiplicandAsMilimeters * multiplier
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter your number") {
                    TextField("Enter a number", value: $input, format: .number)
                }
                
                Section("Select a unit") {
                    Picker("From", selection: $baseUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                
                Section("Select another unit") {
                    Picker("To", selection: $targetUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                
                Section("Result") {
                    Text(conversion.formatted())
                }
            }.navigationTitle("Unit Tool")
        }
    }
}

#Preview {
    ContentView()
}
