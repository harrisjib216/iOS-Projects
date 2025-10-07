//
//  BundleDecodable.swift
//  SnowSeeker
//
//  Created by jibril harris on 6/26/25.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to load url for \(file) from the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file) from the bundle")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle because of missing key: \(key) - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle because of type mismatch: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle because of missing type: \(type) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode \(file) from bundle because of invalid json: \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from bundle because of: \(error.localizedDescription)")
        }
    }
}
