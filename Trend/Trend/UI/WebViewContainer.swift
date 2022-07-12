//
//  WebViewContainer.swift
//  Trend
//
//  Created by Adrian Bilescu on 30.06.2022.
//

import UIKit
import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
