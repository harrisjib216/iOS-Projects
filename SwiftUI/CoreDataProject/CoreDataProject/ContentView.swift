//
//  ContentView.swift
//  CoreDataProject
//
//  Created by jibril harris on 7/10/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movie>
    
    var body: some View {
        VStack {
            List(movies, id: \.self) { movie in
                HStack {
                    VStack {
                        Text(movie.wrappedTitle)
                        Text(movie.wrappedDirector)
                    }
                    
//                    Text(movie.year, format: .number)
                }
            }
            
            Button("add movie") {
                do {
                    let movie = Movie(context: moc)
                    movie.title = "movie #\(movies.count + 1)"
                    movie.director = "diretor \(Int.random(in: 1...15))"
                    movie.year = Int16(2025 + movies.count)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            Button("save movies") {
                if moc.hasChanges {
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
