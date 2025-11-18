//
//  OpenAIResponse.swift
//  LLM&Ms
//
//  Created by jibril harris on 7/8/25.
//

import Foundation

struct OpenAIResponse: Decodable {
    let id: String
    let output: [OpenAIMessage]
}

struct OpenAIMessage: Decodable {
    let content: [OpenAIMessageContent]
}

struct OpenAIMessageContent: Decodable {
    let text: String
}
