//
//  ViewController.swift
//  ActionSheet
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertController: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        alertController = UIAlertController(title: "Send me via?", message: "You can send me via email or iMessage", preferredStyle: .ActionSheet)
        
        let emailAction = UIAlertAction(title: "Email", style: .Default) { (action) in
            // send the file via email
            print("send the file via email")
        }
        
        let iMessageAction = UIAlertAction(title: "iMessage", style: .Default) { (action) in
            // send the file via iMessage
            print("send the file via iMessage")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            print("ActionSheet was canceled")
        }
        
        alertController.addAction(emailAction)
        alertController.addAction(iMessageAction)
        alertController.addAction(cancelAction)
    }

    @IBAction func showActionSheet(sender: AnyObject) {
        presentViewController(alertController, animated: true, completion: nil)
    }



}

