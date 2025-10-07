//
//  ProfileImage.swift
//  Winstagram4
//
//  Created by jibril harris on 7/25/25.
//

import SwiftUI

struct ProfileImage: View {
    var profileImgUrl: URL
    var size: CGFloat
    
    var body: some View {
        AsyncImage(url: profileImgUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
            } else {
                GlimmerAnimation(systemImage: "person.fill", systemImageSize: 32)
            }
        }
        .frame(width: size, height: size)
        .background(.gray.opacity(0.3))
        .clipShape(Circle())
    }
}

#Preview {
    ProfileImage(
        profileImgUrl: UserProfile.samples.first!.profileImg,
        size: 80.0
    )
}
