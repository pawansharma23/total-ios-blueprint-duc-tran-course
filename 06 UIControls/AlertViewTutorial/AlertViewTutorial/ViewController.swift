//
//  ViewController.swift
//  AlertViewTutorial
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertController: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Construct an alert View
        alertController = UIAlertController(title: "Here's the title", message: "Hello, this is a daily chanllenge", preferredStyle: .Alert)
        
        // add an action
        let alertAction = UIAlertAction(title: "Cancel", style: .Default) { (action) in
            print("Cancel button was pressed")
        }
        
        alertController?.addAction(alertAction)
        alertController?.addTextFieldWithConfigurationHandler({ (textField) in
            // configure the textField
            textField.placeholder = "Enter your username"
        })
        
        let alertActionForTextField = UIAlertAction(title: "Log in", style: .Default) { (action) in
            if let textFields = self.alertController?.textFields {
                let theTextFields = textFields
                let username = theTextFields[0].text
                print("Your username is \(username!)")
            }
        }
        
        alertController?.addAction(alertActionForTextField)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        presentViewController(alertController!, animated: true, completion: nil)
    }



}

