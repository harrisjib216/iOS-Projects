//
//  MessageInput.swift
//  CodingTutor
//
//  Created by jibril harris on 7/8/25.
//

import SwiftUI

struct MessageInput: View {
    @FocusState private var isInputFocused: Bool
    @Binding var newMessage: String
    let sendMessage: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            TextField("Ask a computer question", text: $newMessage, axis: .vertical)
                .focused($isInputFocused)
                .textFieldStyle(.roundedBorder)
                .onSubmit(onSubmit)
            
            Button("Send message", systemImage: "arrow.up.circle.fill", action: onSubmit)
                .labelStyle(.iconOnly)
                .font(.title)
                .disabled(newMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .onAppear {
            isInputFocused = true
        }
    }
    
    func onSubmit() {
        sendMessage()
        isInputFocused = true
    }
}

#Preview {
    MessageInput(newMessage: .constant("What are computers")) {
        
    }
}
