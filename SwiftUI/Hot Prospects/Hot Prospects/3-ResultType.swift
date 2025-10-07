//
//  ContentView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI

struct Ex3: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let task = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let res = await task.result
        
        switch res {
        case .success(let str):
            output = str
        case .failure(let err):
            output = err.localizedDescription
        }
    }
}

#Preview {
    Ex3()
}
