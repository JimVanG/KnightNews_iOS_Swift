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
    
    let webView: WKWebView!
    var urlRequest: NSURLRequest!
    
    required init(coder: NSCoder) {
        
        super.init()
        
        //        self.navigationController?.toolbarHidden = false
        
//        self.hidesBottomBarWhenPushed = true
        self.navigationController?.toolbarHidden = false
        
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = false
        configuration.mediaPlaybackRequiresUserAction = true
        self.webView = WKWebView(frame: CGRectZero, configuration: configuration)

        super.init(nibName: nil, bundle: nil)
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
        
        let width = self.view.frame.width
//        let height = self.navigationController?.toolbar.frame.height
        let frame = CGRectMake(0, 0, width, 44)
        
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Rewind, target: self, action: "back")
        
        var itemsArray = [backButton, flexSpace]
        self.toolbarItems = itemsArray
        
        
        
        
//        var toolBar = UIToolbar(frame: CGRectMake(0, 0, frame.width,
//            frame.height))
//        
//        toolBar.items = itemsArray
//        
//        self.view.addSubview(toolBar)
        
        
        self.webView.loadRequest(urlRequest)
        
    }
    
}

extension NSCoder {
    class func empty() -> NSCoder {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.finishEncoding()
        return NSKeyedUnarchiver(forReadingWithData: data)
    }
}