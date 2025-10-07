//
//  ContentView.swift
//  BetterRest
//
//  Created by development on 3/10/25.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var desiredSleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var estBedtime = ""
    @State private var showError = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Estimated bedtime \(estBedtime == "" ? "" : ": " + estBedtime)")
                    .font(.title)
                
                Spacer()
                
                Form {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // wake up time
                        Text("When do you want to wake up?")
                            .font(.headline)
                        
                        DatePicker("Please enter a time",
                                   selection: $wakeUp,
                                   displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        
                        Spacer()
                        
                        // sleep wanted
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper("\(desiredSleepAmount.formatted()) hours",
                                value: $desiredSleepAmount,
                                in: 4...12,
                                step: 0.5)
                        
                        Spacer()
                        
                        // coffee intakd
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        Stepper("^[\(coffeeAmount) cup](inflect: true)",
                                value: $coffeeAmount,
                                in: 1...12)
                        
                        Spacer()
                        
                        // calc
                        Button("Calculate bedtime", action: calcBedtime)
                            .buttonStyle(.bordered)
                            .frame(alignment: .center)
                    }
                    .padding(.vertical, 16.0)
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calcuate bedtime", action: calcBedtime)
//            }
            .alert("Could not compute", isPresented: $showError) {
                Button("Ok") { }
            } message: {
                Text("Please try again")
            }
        }
    }
    
    func calcBedtime() {
        estBedtime = ""

        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let timeAvailableUntilWakeUp = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hours = (timeAvailableUntilWakeUp.hour ?? 0) * 60 * 60
            let minutes = (timeAvailableUntilWakeUp.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: desiredSleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            estBedtime = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
