//
//  ChildFriendlyWebDelegate.swift
//  Master Detail Project
//
//  Created by Israel on 05/11/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit
import WebKit

class ChildFriendlyWebDelegate: NSObject, WKNavigationDelegate {

    var childFriendlySites = ["apple.com", "google.com"]
    
    func isAllowed(url: URL?) -> Bool {
        guard let host = url?.host else { return false }

        if childFriendlySites.contains(where: host.contains) {
            return true
        }

        return false
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if isAllowed(url: navigationAction.request.url) {
            decisionHandler(.allow)
        } else {
            decisionHandler(.cancel)
        }
    }
}
