//
//  WebViewController.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/23/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    
    var urlRequest: NSURLRequest!
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        
        self.hidesBottomBarWhenPushed = true
        
        
    }
    
    
    override func viewDidLoad() {

        self.webView.delegate = self
        self.webView.loadRequest(urlRequest)
        
    }
    
    func updateButtons() {
        self.forwardButton.enabled = self.webView.canGoForward
        self.backButton.enabled = self.webView.canGoBack
        self.stopButton.enabled = self.webView.loading
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.updateButtons()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.updateButtons()

    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        self.updateButtons()

    }
}
