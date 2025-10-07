//
//  TranslationField.swift
//  iNihongo
//
//  Created by development on 1/25/25.
//

import SwiftUI
import Translation

struct TranslationField: View {
    let width = UIScreen.main.bounds.width - 32.0
    let height = UIScreen.main.bounds.height - 32.0
    
    let isInput: Bool
    let header: String
    let content: Binding<String>
    let onTextChange: (_ text: String) -> Void
//    let translationConfig: TranslationSession.Configuration?
    
    init(
        isInput: Bool,
        header: String,
        content: Binding<String>,
//        translationConfig: TranslationSession.Configuration?,
        onTextChange: @escaping (_ text: String) -> Void = {text in }
    ) {
        self.isInput = isInput
        self.header = header
        self.content = content
        self.onTextChange = onTextChange
//        self.translationConfig = translationConfig
    }
    
    var body: some View {
        Text(header)
            .frame(width: .infinity, alignment: .leading)
        
        TextEditor(text: content)
            .onChange(of: content.wrappedValue, { oldValue, newValue in
                print(newValue)
                onTextChange(newValue)
            })
            .disabled(!isInput)
            .frame(height: height / 4)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
//            .translationTask(translationConfig) { session in
//                do {
//                    let response = try await session.translate(input)
//                    translatedMessage = response.targetText
//                    isTranslationSheetPresent = true
//                } catch {
//                    // Handle any errors.
//                }
//            }
    }
}

#Preview {
    @Previewable @State var content = ""
    
    TranslationField(
        isInput: true,
        header: "🌎 Language",
        content: $content
    ) { text in
        print(text)
    }
}
