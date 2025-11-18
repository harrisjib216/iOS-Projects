//
//  MessageBubble.swift
//  CodingTutor
//
//  Created by jibril harris on 7/8/25.
//

import SwiftUI

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        let alignment = message.isAi ? Alignment.leading : .trailing
        
        Text(message.text)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .foregroundStyle(message.isAi ? Color.primary : .white)
            .background(message.isAi ? .gray.opacity(0.2) : .blue)
            .clipShape(.rect(cornerRadius: 16))
            .containerRelativeFrame(.horizontal, alignment: alignment) { size, axis in
                size * 0.75
            }
            .frame(maxWidth: .infinity, alignment: alignment)
            .transition(.move(edge: message.isAi ? .leading : .trailing))
            .id(message.id)
    }
}

#Preview {
    MessageBubble(
        message: Message(text: "Hi", isAi: false)
    )
}
