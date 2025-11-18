//
//  APIClient.swift
//  LLM&Ms
//
//  Created by jibril harris on 7/7/25.
//

import Foundation

struct APIClient {
    var apiKey: String
    
    func generateText(
        instructions: String,
        prompt: String,
        previousResponse: String? = nil
    ) async throws -> (id: String, message: String) {
        let url = URL(string: "https://api.openai.com/v1/responses")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        var requestBody: [String: Any] = [
            "model": "gpt-4.1-nano",
            "input": prompt,
            "instructions": instructions
        ]
        
        if let previousResponse {
            requestBody["previous_response_id"] = previousResponse
        }
        
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let openAiResponse = try JSONDecoder().decode(OpenAIResponse.self, from: data)
        
        let message = openAiResponse.output.map { openAIMessage in
            openAIMessage.content.map {
                $0.text
            }
            .joined(separator: "\n")
        }
        .joined(separator: "\n")
        
        print(message)
        
        return (openAiResponse.id, message)
    }
}
