//
//  ContentView.swift
//  Instafilter
//
//  Created by jibril harris on 6/6/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct PlayingWithAFilter: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear {
            loadImage()
        }
    }
    
//    func loadImage() {
//        let inputImage = UIImage(resource: .phone)
//        let beginImage = CIImage(image: inputImage)
//        
//        //
//        let context = CIContext()
//        let sepiaFilter = CIFilter.sepiaTone()
//        
//        sepiaFilter.inputImage = beginImage
//        sepiaFilter.intensity = 1
//        
//        guard let outputImage = sepiaFilter.outputImage else { return }
//        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
//        
//        let uiImage = UIImage(cgImage: cgImage)
//        image = Image(uiImage: uiImage)
//    }
    
    func loadImage() {
        let inputImage = UIImage(resource: .phone)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let filter = CIFilter.twirlDistortion()
        
        filter.inputKeys.map { item in
            print(item)
        }
        
        filter.inputImage = beginImage
//        filter.intensity = 1
        
        guard let outputImage = filter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    PlayingWithAFilter()
}
