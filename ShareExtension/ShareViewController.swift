//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Sergio Veliz on 5/30/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
    private var urlString: String?
    private var textString: String?

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        guard let text = textView.text else {return}

        if let ud = UserDefaults(suiteName: "DataStructuresProfiling") {
            ud.set(text, forKey: "text")
        }
        if let url = URL(string: urlString ?? String()) {
            _ = openURL(url)
        }
        dismiss(animated: false) {
            self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        }
        
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
    @objc func openURL(_ url: URL) -> Bool {
        var responder: UIResponder? = self
        while responder != nil {
            if let app = responder as? UIApplication {
                return app.perform(#selector(openURL(_:)), with: url) != nil
            }
            responder = responder?.next
        }
        return false
    }

}
