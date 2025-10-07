//
//  8-packages.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/23/25.
//

import SwiftUI
import SamplePackage

struct Packages: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}
