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


class WebViewController: UIViewController {
    
    let webView: WKWebView
    var urlRequest: NSURLRequest!
    
    required init(coder: NSCoder = NSKeyedUnarchiver(forReadingWithData: NSData())) {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = false
        configuration.mediaPlaybackRequiresUserAction = true
        self.webView = WKWebView(frame: CGRectZero, configuration: configuration)
        
        super.init(coder: coder)
        
        //        self.navigationController?.toolbarHidden = false
        
        self.hidesBottomBarWhenPushed = true

        let width = self.navigationController?.toolbar
        let height = self.navigationController?.toolbar.frame.height
        let frame = CGRectMake(0, 0, self.view.frame.width, 44)
        
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Rewind, target: self, action: "back")
        
        var itemsArray = [backButton, flexSpace]
        self.toolbarItems = itemsArray
        

        
        
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, frame.width,
            frame.height))
        
        toolBar.setItems(itemsArray, animated: true)
        
        self.view.addSubview(toolBar)
        
        
    }
    
    
    override func viewDidLoad() {
        
        self.view.addSubview(self.webView)
        self.webView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|[wv]|", options: nil, metrics: nil, views: ["wv":self.webView])
        )
        self.view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|[wv]|", options: nil, metrics: nil, views: ["wv":self.webView])
        )
        
        
        self.webView.loadRequest(urlRequest)
        
    }
    
}