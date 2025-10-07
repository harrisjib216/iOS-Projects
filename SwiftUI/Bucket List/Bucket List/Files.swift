//
//  ContentView.swift
//  Bucket List
//
//  Created by jibril harris on 6/7/25.
//

import SwiftUI

struct Files: View {
    var body: some View {
        Button("read and write") {
            let data = Data("test message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                
                let input = try String(contentsOf: url, encoding: .utf8)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    Files()
}
