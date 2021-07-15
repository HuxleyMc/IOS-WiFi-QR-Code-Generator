//
//  GenerateView.swift
//  WiFiDucky
//
//  Created by Huxley McGuffin on 15/7/21.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct GenerateView: View {
    var qrString: String
    var name: String = "Qr Code"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    
    var body: some View {
        VStack {
            Image(uiImage: generateQRCode(from: qrString))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .padding([.leading, .trailing])
                
            
        }
        .navigationTitle(name)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GenerateView(qrString: "WIFI:T:WPA;S:SSIDNAME;P:PASSWORD;;", name: "Test")
        }
    }
}
