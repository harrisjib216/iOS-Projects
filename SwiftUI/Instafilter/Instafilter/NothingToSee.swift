//
//  Example.swift
//  Instafilter
//
//  Created by jibril harris on 6/6/25.
//

import SwiftUI

struct NothingToSee: View {
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("No saved snippets"))
    }
}

#Preview {
    NothingToSee()
}
