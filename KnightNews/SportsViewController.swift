//
//  SportsViewController.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/22/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import Foundation
import UIKit


class SportsViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var webViewFootball: UIWebView!
    @IBOutlet weak var webViewBasketball: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //first webview
        self.webViewFootball.loadRequest(NSURLRequest(URL:
            NSURL(string: "http://espn.go.com/college-football/team/_/id/2116/ucf-knights")!))
        self.webViewFootball.hidden = false
        self.webViewFootball.delegate = self
        
        //second webView
        self.webViewBasketball.loadRequest(NSURLRequest(URL:
            NSURL(string: "http://espn.go.com/mens-college-basketball/team/_/id/2116/ucf-knights")!))
        self.webViewBasketball.hidden = true
        self.webViewBasketball.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: SegmentControl Action
    @IBAction func changeUrl(sender: AnyObject) {
        var seg = sender as UISegmentedControl
        
        switch seg.selectedSegmentIndex {
        case 0:
            self.webViewBasketball.hidden = true
            self.webViewFootball.hidden = false
            break
        case 1:
            self.webViewFootball.hidden = true
            self.webViewBasketball.hidden = false
            break
            
        default:
            self.webViewBasketball.hidden = true
            self.webViewFootball.hidden = false
            break
        }
    }
    
    // MARK: Delegate Methods
    func webViewDidFinishLoad(webView: UIWebView) {
        // TODO: Stop progressHUD
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        // TODO: Handle link clicks, open up a new webViewVC
        
        return true
    }
    
}