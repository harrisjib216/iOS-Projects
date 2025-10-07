//
//  Example.swift
//  Instafilter
//
//  Created by jibril harris on 6/6/25.
//

import PhotosUI
import SwiftUI

struct PhotoChooser: View {
//    singular
//    @State private var pickerItem: PhotosPickerItem?
//    @State private var selectedImage: Image?
    
//    var body: some View {
//        VStack {
//            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
//
//            selectedImage?
//                .resizable()
//                .scaledToFit()
//        }
//        .onChange(of: pickerItem) {
//            Task {
//                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
//            }
//        }
//    }

//    multi
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $pickerItems,
                maxSelectionCount: 3,
                matching: .any(of: [.images, .not(.screenshots)])
            ) {
                Label("Add some pictures", systemImage: "photo")
            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { index in
                    selectedImages[index]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                for item in pickerItems {
                    if let image = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(image)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoChooser()
}
