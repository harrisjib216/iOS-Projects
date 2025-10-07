//
//  ContentView.swift
//  Navigation
//
//  Created by jibril harris on 4/28/25.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "PathStore")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let encodedPath = path.codable else {
            return
        }

        do {
            let data = try JSONEncoder().encode(encodedPath)
            try data.write(to: savePath)
        } catch {
            print("failed to save")
        }
    }
}

struct DetailView: View {
    var num: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Current: \(num)")
    }
}

struct ContentView: View {
    @State private var path = PathStore()
    
    var body: some View {
        NavigationStack(path: $path.path) {
            DetailView(num: 0)
                .navigationDestination(for: Int.self) { num in
                    DetailView(num: num)
                }
        }
    }
}

#Preview {
    ContentView()
}
