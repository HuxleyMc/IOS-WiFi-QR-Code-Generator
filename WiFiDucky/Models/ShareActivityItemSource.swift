//
//  ShareActivityItemSource.swift
//  WiFiDucky
//
//  Created by Huxley McGuffin on 16/7/21.
//

import Foundation
import LinkPresentation

class ShareActivityItemSource: NSObject, UIActivityItemSource {
    
    var shareText: String
    var shareImage: UIImage
    var linkMetaData = LPLinkMetadata()
    
    init(shareText: String, shareImage: UIImage) {
        self.shareText = shareText
        self.shareImage = shareImage
        
        
        let imageProvider = NSItemProvider(object: shareImage)
        
        linkMetaData.title = shareText
        linkMetaData.imageProvider = imageProvider
        
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return UIImage(named: "AppIcon ") as Any
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        return self.linkMetaData
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return nil
    }
    
}
