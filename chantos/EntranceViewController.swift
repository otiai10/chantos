//
//  EntranceViewController.swift
//  chantos
//
//  Created by Hiromu Ochiai on 2015/07/29.
//  Copyright (c) 2015年 Hiromu Ochiai. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {

    @IBOutlet weak var serverURLInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let input = self.serverURLInput.text
        
        // TODO: validate input
        
        let nextVC = segue.destinationViewController as! MainChatViewController
   
        
        nextVC.serverURL = input
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
