//
//  MyActivityItemSource.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import LinkPresentation

class MyActivityItemSource: NSObject, UIActivityItemSource {
    var title: String
    var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return text
    }
    
    func activityViewController(
        _ activityViewController: UIActivityViewController,
        itemForActivityType activityType: UIActivity.ActivityType?
    ) -> Any? {
        return text
    }
    
    func activityViewController(
        _ activityViewController: UIActivityViewController,
        subjectForActivityType activityType: UIActivity.ActivityType?
    ) -> String {
        return title
    }

    func activityViewControllerLinkMetadata(
        _ activityViewController: UIActivityViewController
    ) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = title
        metadata.originalURL = URL(fileURLWithPath: text)
        return metadata
    }

}
