//
//  ShareSheetView.swift
//  WiFiDucky
//
//  Created by Huxley McGuffin on 16/7/21.
//

import Foundation
import SwiftUI


struct ShareSheetView: UIViewControllerRepresentable {
    var activityItems: [Any]
          
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)
        
        return controller
    }

    
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}

