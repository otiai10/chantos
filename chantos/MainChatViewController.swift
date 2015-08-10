//
//  MainChatViewController.swift
//  chantos
//
//  Created by Hiromu Ochiai on 2015/07/26.
//  Copyright (c) 2015年 Hiromu Ochiai. All rights reserved.
//

import UIKit

class MainChatViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mainChatWebView: UIWebView!
    @IBOutlet weak var exitBtn: UIBarButtonItem!
    @IBOutlet weak var configsBtn: UIBarButtonItem!
    
    var serverURL: String!
    var serverHost: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainChatWebView.delegate = self;

        // Do any additional setup after loading the view.
        let url = NSURL(string: self.serverURL)
        self.serverHost = url!.host
        let req = NSURLRequest(URL: url!)
        self.mainChatWebView.loadRequest(req)

        self.configsBtn.title = NSString(string: "\u{2699}") as String
        if let font = UIFont(name: "Helvetica", size: 18.0) {
            self.configsBtn.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog(self.mainChatWebView.stringByEvaluatingJavaScriptFromString("location.pathname")!)
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let host: String! = request.URL!.host
        if host == nil {
            return true
        }
        NSLog(host)
        switch host {
        case self.serverHost:
            return true
        case "api.twitter.com","syndication.twitter.com","w.soundcloud.com","platform.twitter.com":
            return true
        default:
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
        }
    }

    @IBAction func TouchExitBtn(sender: AnyObject) {
        let url = NSURL(string: self.serverURL + "/logout")
        let req = NSURLRequest(URL: url!)
        self.mainChatWebView.loadRequest(req)

        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
