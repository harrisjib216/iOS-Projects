//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by jibril harris on 5/16/25.
//

import SwiftUI

struct EmojiRatingView: View {
    var rating: Int
    
    var body: some View {
        switch rating {
        case 2:
            Text("🫩")
        case 3:
            Text("🙂")
        case 4:
            Text("😁")
        case 5:
            Text("🤯")
        default:
            Text("😠")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 4)
}
