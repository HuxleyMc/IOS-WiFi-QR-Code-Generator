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
    var name: String = "Network"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    @State var isPresented: Bool = false
    
    
    private var QRCode: UIImage {
        generateQRCode(from: qrString)
    }
    
    
    
    var body: some View {
        VStack {
            Image(uiImage: QRCode)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .padding([.leading, .trailing])
            
            
            Button(action: {
                isPresented = true
            }) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
            .font(.headline)
            .foregroundColor(.blue)
            .sheet(isPresented: $isPresented) {
                // UpScale image for saving to photos or sharing
                ShareSheetView(
                    activityItems: [
                        ShareActivityItemSource(shareText: "\(name) QR Code", shareImage: QRCode),
                        QRCode.resized(toWidth: 512) ?? QRCode
                    ]
                )
            }
            
            
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
