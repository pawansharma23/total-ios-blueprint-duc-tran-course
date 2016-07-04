//
//  ViewController.swift
//  UIWebViewDemo
//
//  Created by Duc Tran on 5/6/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

/*
 * Using a WebView:
 *      + loadData:MIMEType:textEncodingName:baseURL:  => load NSData into webview
 *      + loadHTMLString:baseURL: => load a String of valid HTML that the browser can render
 *      + loadRequest: => load a NSURLRequest constructed from a NSURL *popular*
 */

class ViewController: UIViewController, UIWebViewDelegate {
    
    let htmlString = "<br/><strong>Styde.net</strong><br/>FREE iOS Tutorials Every Week"
    
    let featuredURL = "http://www.styde.net"
    let tutorialsURL = "https://styde.net/blog/"
    let coursesURL = "https://styde.net/cursos/"
    let signupURL = "https://styde.net/login/"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadHTML()
        loadOurWebsite(featuredURL)
    }

    // load a String of valid HTML
    func loadHTML() {
        let webView = UIWebView(frame: view.bounds)
        webView.loadHTMLString(htmlString, baseURL: nil)
        view.addSubview(webView)
    }
    
    // load a website from a url
    func loadOurWebsite(stringURL: String) {
        let webView = UIWebView(frame: view.bounds)
        webView.scalesPageToFit = true
        webView.delegate = self
        view.addSubview(webView)
        
        if let url = NSURL(string: stringURL) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }
    
    
    @IBAction func menuChanged(sender: UISegmentedControl)
    {
        let selectedIndex = sender.selectedSegmentIndex
        switch selectedIndex
        {
        case 0: loadOurWebsite(featuredURL)
        case 1: loadOurWebsite(tutorialsURL)
        case 2: loadOurWebsite(coursesURL)
        default: loadOurWebsite(featuredURL)
            break
        }
    }

    
    @IBAction func loadSignUpPage(sender: AnyObject)
    {
       loadOurWebsite(signupURL)
    }
    
    // MARK: - UIWebViewDelegate
    
    // add network activity indicator:
    //      (1) subscribe self as web view delegate => get noticed when it starts loading
    //      (2) when it finished loading, we also get noticed
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

}















