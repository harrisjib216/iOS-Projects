//
//  DetailView.swift
//  BookWorm
//
//  Created by jibril harris on 5/16/25.
//

import SwiftUI
import SwiftData

let genreImages = [
    "Fiction": URL(string: "https://plus.unsplash.com/premium_photo-1669652639337-c513cc42ead6?q=80&w=3648&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!,
    "Poetry": URL(string: "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?q=80&w=3546&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!,
    "Realistic Fiction": URL(string: "https://plus.unsplash.com/premium_photo-1734711077997-9456ed36a77c?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!,
    "Non-fiction": URL(string: "https://images.unsplash.com/photo-1529590003495-b2646e2718bf?q=80&w=3476&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
]

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false

    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: genreImages[book.genre]!) { image in
                    if let image = image.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if image.error != nil {
                        VStack {
                            Text("Failed to load: \(image.error?.localizedDescription)")
                        }
                        .frame(height: 200)
                    }
                    else {
                        ProgressView()
                    }
                }
                
                Text(book.genre.capitalized)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        
        let book = Book(title: "Test book", author: "Test author", genre: "Fiction", review: "Good book", rating: 3)
        
        return DetailView(book: book)
            .modelContainer(container)
    } catch {
        return Text("Failed to preview: \(error.localizedDescription)")
    }
}
