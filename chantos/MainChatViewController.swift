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
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainChatWebView.delegate = self;

        // Do any additional setup after loading the view.
        let url = NSURL(string: "http://chant:guess@chant.otiai10.com")
        let req = NSURLRequest(URL: url!)
        self.mainChatWebView.loadRequest(req)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog(self.mainChatWebView.stringByEvaluatingJavaScriptFromString("location.pathname")!)
    }

    @IBAction func TouchExitBtn(sender: AnyObject) {
        let url = NSURL(string: "http://chant:guess@chant.otiai10.com/logout")
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
