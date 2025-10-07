//
//  Dragging.swift
//  LayoutAndGeometry
//
//  Created by jibril harris on 6/24/25.
//

import SwiftUI

struct Dragging: View {
    @State private var offset = CGSize.zero
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { newOffset in
//                        buggy
                        offset = newOffset.translation
                    }
            )
    }
}

#Preview {
    Dragging()
}
