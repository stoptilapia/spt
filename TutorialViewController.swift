//
//  TutorialViewController.swift
//  Spt
//
//  Created by Karl Taylor on 2/1/17.
//  Copyright © 2017 Sonne & Taylor. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var tutorialURL : NSURL!

    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        webview.isHidden = true
        toolbar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if tutorialURL != nil {
            let request : NSURLRequest = NSURLRequest(url: tutorialURL as URL)
            webview.loadRequest(request as URLRequest)
            
            if webview.isHidden {
                webview.isHidden = false
                toolbar.isHidden = false
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showPublishDate(sender: AnyObject) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
