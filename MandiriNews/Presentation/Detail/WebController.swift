//
//  WebController.swift
//  MandiriNews
//
//  Created by Indra Cahyadi on 28/06/20.
//  Copyright © 2020 Indra Cahyadi. All rights reserved.
//

import UIKit
import WebKit
import Foundation

class WebController: UIViewController, WKNavigationDelegate {
    
    var urlString: LAObservable<String> = LAObservable("")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Test"
        let webview = WKWebView()
        webview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        guard let url = URL(string: urlString.value) else {
           return
        }
        let request = URLRequest(url: url)
        webview.load(request)
        webview.navigationDelegate = self
        view.addSubview(webview)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.view = webView
    }
}
