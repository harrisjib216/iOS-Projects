//
//  ContentView.swift
//  WordScramble
//
//  Created by development on 3/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(newWord.count).circle")
                            Text(word)
                        }
                        .accessibilityElement()
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                Button("New word", action: startGame)
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showError) { } message: {
                Text(errorMessage)
            }
        }
    }
    
    func startGame() {
        usedWords = [String]()
        rootWord = ""
        newWord = ""
        
        errorTitle = ""
        errorMessage = ""
        showError = false
        
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            if let startWords = try? String(contentsOf: startWordsUrl, encoding: .ascii) {
                let allWords = startWords.components(separatedBy: .newlines)
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count >= 3 else {
            return
        }
        
        guard isNotRootWord(word: answer) else {
            displayError(title: "Cannot use root word", message: "Try a different word")
            return
        }
        
        guard isOriginal(word: answer) else {
            displayError(title: "Word used already", message: "Try a different word")
            return
        }
        
        guard isPossible(word: answer) else {
            displayError(title: "Cannot be made from \"\(rootWord)\"", message: "Try a different word")
            return
        }
        
        guard isReal(word: answer) else {
            displayError(title: "Word not recognized", message: "Try a different word")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func isNotRootWord(word: String) -> Bool {
        word != rootWord
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var availableLetters = [Character:Int]()

        for char in rootWord {
            if availableLetters[char] == nil {
                availableLetters[char] = 1
            } else {
                availableLetters[char]! += 1
            }
        }
        
        for char in word {
            if availableLetters[char] == nil || availableLetters[char] == 0 {
                return false
            }
            
            availableLetters[char]! -= 1
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    
        return !(mispelledRange.location == NSNotFound)
    }
    
    func displayError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
}

#Preview {
    ContentView()
}
