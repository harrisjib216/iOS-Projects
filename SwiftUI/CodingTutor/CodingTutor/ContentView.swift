//
//  ContentView.swift
//  LLM&Ms
//
//  Created by jibril harris on 7/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var client = APIClient(apiKey: "")

    @State private var messages = [Message]()
    @State private var newMessage = ""

    @State private var isAiTyping = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(messages, content: MessageBubble.init)
                        }

                        if isAiTyping {
                            HStack {
                                TypingIndicator()
                                Spacer()
                            }
                            .transition(.move(edge: .leading))
                        }
                    }
                    .defaultScrollAnchor(.bottom)
                    .onChange(of: messages) {
                        Task {
                            try await Task.sleep(for: .seconds(0.2))

                            proxy.scrollTo(messages.last?.id, anchor: .bottom)
                        }
                    }
                }

                MessageInput(newMessage: $newMessage, sendMessage: sendMessage)
                    .padding(.vertical, 8)
            }
            .padding(.horizontal)
        }
    }

    func sendMessage() {
        let prompt = newMessage.trimmingCharacters(in: .whitespacesAndNewlines)

        guard prompt.isEmpty == false else { return }

        withAnimation {
            messages.append(Message(text: newMessage, isAi: false))
            newMessage = ""
        }

        Task {
            do {
                let lastMessageFromOpenAi = messages.last(where: \.isAi)

                let openAiResponse = try await client.generateText(
                    instructions: "You are a chatbot that has a conversation about computers (hardware, software, programs, code, etc.) You might be talking to minors, so never use or tolerate offensive language or any inappropriate content.",
                    prompt: prompt,
                    previousResponse: lastMessageFromOpenAi?.id
                )

                await MainActor.run {
                    withAnimation {
                        messages.append(Message(
                            id: openAiResponse.id,
                            text: openAiResponse.message,
                            isAi: true
                        ))
                    }
                }
            } catch {
                await MainActor.run {
                    withAnimation {
                        if client.apiKey.isEmpty {
                            messages.append(Message(text: "Please set your API key", isAi: true))
                        } else {
                            messages.append(Message(text: "Failed to get response", isAi: true))
                        }
                        
                        isAiTyping = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
