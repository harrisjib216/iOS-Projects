//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by jibril harris on 6/24/25.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    @State private var prompt = ""
    @State private var answer = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $prompt)
                    
                    TextField("Answer", text: $answer)
                    
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            
                            Text(card[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadCards)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func loadCards() {
        if let data = UserDefaults.standard.data(forKey: "cards") {
            if let items = try? JSONDecoder().decode([Card].self, from: data) {
                cards = items
            }
        }
    }
    
    func saveCards() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "cards")
        }
    }
    
    func addCard() {
        let trimmedPrompt = prompt.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswer = answer.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard trimmedAnswer.isEmpty || trimmedPrompt.isEmpty else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        
        saveCards()
        
        prompt = ""
        answer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveCards()
    }
}

#Preview {
    EditCardsView()
}
