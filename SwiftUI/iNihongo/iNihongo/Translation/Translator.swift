//
//  Translator.swift
//  iNihongo
//
//  Created by development on 1/24/25.
//

import SwiftUI
import Translation

struct Translator: View {
    private let debouncer = Debouncer(delay: 0.3)
    
    // todo: move state vars
    @State var translationConfig: TranslationSession.Configuration?
    @State var needsToInstallJapanese = true
    
    @State var inputHeader = "🇺🇸 English"
    @State var input = ""
    
    @State var outputHeader = "🇯🇵 Japanese"
    @State var output = ""
    
    // todo: rename
    func getLangConfig(english sourceIsEnglish: Bool) -> TranslationSession.Configuration {
        return if sourceIsEnglish {
            TranslationSession.Configuration(
                source: Locale.Language(components: .init(languageCode: "en", script: nil, region: "US")),
                target: Locale.Language(components: .init(languageCode: "jp", script: nil, region: "JP"))
            )
        } else {
            TranslationSession.Configuration(
                source: Locale.Language(components: .init(languageCode: "jp", script: nil, region: "JP")),
                target: Locale.Language(components: .init(languageCode: "en", script: nil, region: "US"))
            )
        }
    }

    func onInputChange(_ newInput: String) {
        debouncer.run {
            if translationConfig == nil {
                translationConfig = getLangConfig(english: true)
            } else {
                translationConfig?.invalidate()
            }
        }
    }
    
    func swapInput() {
        (inputHeader, outputHeader) = (outputHeader, inputHeader)
        (input, output) = (output, input)
        
        translationConfig = if inputHeader == "🇺🇸 English" {
            getLangConfig(english: false)
        } else {
            getLangConfig(english: true)
        }
    }
    
    var body: some View {
        VStack {
            // input
            TranslationField(
                isInput: true,
                header: inputHeader,
                content: $input,
                onTextChange: onInputChange
            )
            
            // swap
            SwapLanguageButton(action: swapInput)
                .padding(EdgeInsets(top: 0.0, leading: 0, bottom: 24.0, trailing: 0.0))
            
            // output
            TranslationField(
                isInput: false,
                header: outputHeader,
                content: $output
//                translationConfig: translationConfig
            )
        }
        .translationTask(translationConfig) { session in
            if (needsToInstallJapanese) {
                do {
                    print("downloading")
                    try await session.prepareTranslation()
                    
                    do {
                        print("translating")
                        let response = try await session.translate(input)
                        output = response.targetText
                        print(output)
                    } catch {
                        print("failed \(error)")
                    }
                } catch {
                    print("Failed to download \(error)")
                    return
                }
            }
//            await LanguageAvailability.init().supportedLanguages.forEach { item in
//                print(item)
//            }
        }
    }
}

//#Preview {
//    Translator()
//}
