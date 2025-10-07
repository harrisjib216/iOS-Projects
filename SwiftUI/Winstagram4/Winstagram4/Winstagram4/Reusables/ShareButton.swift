//
//  ShareButton.swift
//  Winstagram4
//
//  Created by jibril harris on 7/25/25.
//

import SwiftUI

struct ShareButton: View {
    @State private var showShareSheet = false
    private struct ShareSheet: UIViewControllerRepresentable {
        var activityItems: [Any]
        var applicationActivities: [UIActivity]? = nil

        func makeUIViewController(context: Context) -> UIActivityViewController {
            UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        }

        func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
    }
    
    var toShare: [Any]
    
    var body: some View {
        Label(
            "Share",
            systemImage: "paperplane"
        )
        .onTapGesture {
            openShareSheet()
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: toShare)
                .presentationDetents([.medium, .large])
        }
    }
    
    func openShareSheet() {
        showShareSheet = true
    }
}

#Preview {
    ShareButton(
        toShare: [Post.samples.first!.images.first!, "Check this out!"]
    )
}
