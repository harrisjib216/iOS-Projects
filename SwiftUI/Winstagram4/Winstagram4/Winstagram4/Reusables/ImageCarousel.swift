//
//  ImageCarousel.swift
//  Winstagram4
//
//  Created by jibril harris on 7/14/25.
//

import SwiftUI

struct ImageCarousel: View {
    @GestureState private var zoom = 1.0
    @State private var currentImageIndex = 0
    private let size = UIScreen.main.bounds.width

    let imageUrls: [URL]

    var body: some View {
        TabView(selection: $currentImageIndex) {
            ForEach(0..<imageUrls.count, id: \.self) { index in
                AsyncImage(url: imageUrls[index]) { phase in
                    let isFocused = currentImageIndex == index
                    
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(isFocused ? zoom : 1)
                            .gesture(
                                isFocused
                                ? MagnifyGesture()
                                    .updating($zoom) { value, gestureState, transaction in
                                        gestureState = value.magnification
                                    }
                                : nil
                            )
                            .tag(index)
                    } else if phase.error != nil {
                        ContentUnavailableView(
                            "Failed to load image",
                            systemImage: "exclamationmark.triangle"
                        )
                    } else {
                        GlimmerAnimation()
                    }
                }
                .frame(width: size, height: size)
                .clipped()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

#Preview {
    ImageCarousel(
        imageUrls: Post.samples.first!.images
    )
}
