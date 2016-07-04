//
//  ViewController.swift
//  WebKitTutorial
//
//  Created by Jorge Jimenez on 7/4/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    let featuredURL = "http://www.styde.net"
    let tutorialsURL = "https://styde.net/blog/"
    let coursesURL = "https://styde.net/cursos/"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        // create an instance of web view
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        webViewLoadURL(featuredURL)

    }
    
    func webViewLoadURL(urlString: String) {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(URL: url)
            
            webView.loadRequest(urlRequest)
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: Target/Action
    @IBAction func menuChanged(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        switch selectedIndex {
        case 0: webViewLoadURL(featuredURL)
        case 1: webViewLoadURL(tutorialsURL)
        case 2: webViewLoadURL(coursesURL)
        default: break
            
        }
    }
    
    // MARK: - WKNavigationDelegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }


}

