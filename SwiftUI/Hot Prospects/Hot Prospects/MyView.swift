//
//  MyView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/23/25.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct MyView: View {
    @AppStorage("name") private var name = "Anon"
    @AppStorage("email") private var email = "sample@email.com"
    
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        ShareLink(
                            item: Image(uiImage: qrCode),
                            preview: SharePreview(
                                "\(name)'s QR Code",
                                image: Image(uiImage: qrCode)
                            )
                        )
                    }
            }
            .navigationTitle("Your code")
            .onAppear(perform: updateQRCode)
            .onChange(of: name, updateQRCode)
            .onChange(of: email, updateQRCode)
        }
    }
    
    func updateQRCode() {
        qrCode = generateQRCode(from: "\(name)\n\(email)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MyView()
}
