//
//  Bundle-Decoable.swift
//  Moonshot
//
//  Created by jibril harris on 4/8/25.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate file in bundle: \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load: \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode: \(file) Missing key: \(key)  Context: \(context)")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to decode: \(file) Type mismatch: \(type)  Context: \(context)")
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Failed to decode: \(file) Missing value: \(value)  Context: \(context)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode: \(file) Corrupt data: \(context)")
        } catch {
            fatalError("Failed to decode: \(file) because of: \(error.localizedDescription)")
        }
    }
}
